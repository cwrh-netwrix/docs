#!/usr/bin/env python3
"""
Download change_tracker specific images from Salesforce servlet URLs.
Uses the same authentication approach as the existing download scripts.
"""

import os
import re
import csv
import requests
import time
import hashlib
from pathlib import Path
from urllib.parse import urlparse, parse_qs
import sys

# Add the parent directory to the path to import sfdc_auth
sys.path.append('../sfdc_auth')
from sfdc_auth import get_salesforce_client

def load_change_tracker_image_urls(csv_file):
    """Load the change_tracker image URLs from CSV file."""
    images = []
    try:
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                images.append({
                    'url': row['url'],
                    'filename': row['filename'],
                    'eid': row['eid'],
                    'referencing_articles': row.get('referencing_articles', ''),
                    'reference_count': row.get('reference_count', '1')
                })
    except FileNotFoundError:
        print(f"Error: Could not find {csv_file}")
        return []
    except Exception as e:
        print(f"Error reading CSV: {e}")
        return []

    print(f"Loaded {len(images)} image URLs for download")
    return images

def download_image(session, url, filename, output_dir, max_retries=3):
    """Download a single image with retry logic."""
    output_path = Path(output_dir) / filename

    if output_path.exists():
        print(f"✓ Skipping {filename} (already exists)")
        return True

    for attempt in range(max_retries):
        try:
            response = session.get(url, timeout=30)

            if response.status_code == 200:
                # Ensure output directory exists
                output_path.parent.mkdir(parents=True, exist_ok=True)

                with open(output_path, 'wb') as f:
                    f.write(response.content)
                print(f"✓ Downloaded {filename} ({len(response.content)} bytes)")
                return True
            elif response.status_code == 404:
                print(f"✗ Image not found (404): {filename}")
                return False
            else:
                print(f"⚠ HTTP {response.status_code} for {filename} (attempt {attempt + 1})")

        except Exception as e:
            print(f"⚠ Error downloading {filename} (attempt {attempt + 1}): {e}")

        if attempt < max_retries - 1:
            time.sleep(2 ** attempt)  # Exponential backoff

    print(f"✗ Failed to download {filename} after {max_retries} attempts")
    return False

def download_change_tracker_images():
    """Download all change_tracker images using Salesforce authentication."""

    # Setup directories
    script_dir = Path(__file__).parent
    csv_file = script_dir / 'change_tracker_image_servlet_mapping.csv'
    output_dir = script_dir / 'kb_images_changetracker'

    if not csv_file.exists():
        print(f"Error: Image mapping CSV not found: {csv_file}")
        print("Please run extract_servlet_urls.py first")
        return False

    # Load image URLs
    images = load_change_tracker_image_urls(csv_file)
    if not images:
        print("No images to download")
        return False

    # Get Salesforce client for authentication
    try:
        sf = get_salesforce_client()
        print("✓ Connected to Salesforce")
    except Exception as e:
        print(f"✗ Failed to connect to Salesforce: {e}")
        return False

    # Setup requests session with Salesforce authentication
    session = requests.Session()

    # Use the session ID from simple-salesforce
    session_id = sf.session_id
    session.headers.update({
        'Authorization': f'Bearer {session_id}',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
    })

    # Add cookies for Salesforce domains
    salesforce_domains = ['nwxcorp.file.force.com', 'nwxcorp.lightning.force.com', 'nwxcorp.my.salesforce.com']
    for domain in salesforce_domains:
        session.cookies.set('sid', session_id, domain=domain)

    print(f"Starting download of {len(images)} change_tracker images...")
    print(f"Output directory: {output_dir}")

    # Download images
    successful = 0
    failed = 0

    for i, image in enumerate(images, 1):
        print(f"\n[{i}/{len(images)}] {image['filename']}")

        if download_image(session, image['url'], image['filename'], output_dir):
            successful += 1
        else:
            failed += 1

        # Rate limiting to avoid overwhelming the server
        time.sleep(0.5)

    # Summary
    print(f"\n{'='*60}")
    print(f"DOWNLOAD SUMMARY")
    print(f"{'='*60}")
    print(f"Total images: {len(images)}")
    print(f"Successfully downloaded: {successful}")
    print(f"Failed: {failed}")
    print(f"Output directory: {output_dir}")

    if successful > 0:
        print(f"\n✓ Ready for distribution to docs/kb/changetracker/images/")

    return successful > 0

if __name__ == "__main__":
    download_change_tracker_images()