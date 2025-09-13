#!/bin/bash

# RDP Manager Reorganization Script (Magic Formula Approach)
# This script reorganizes RDP Manager from scattered structure to clean top-level organization

set -e

DOCS_ROOT="C:/GITLOCAL/docs/docs/endpointpolicymanager"
RDP_SOURCE="$DOCS_ROOT/manuals/desktopautomationand/remotedesktopprotoco"
RDP_ROOT="$DOCS_ROOT/remotedesktopprotocolmanager"

echo "=== RDP Manager Reorganization (7 files) ==="

# Create new directory structure
mkdir -p "$RDP_ROOT"/{manual/{gettingtoknow,configuration},knowledgebase/{installation,troubleshooting,tipsandtricks},videolearningcenter/{gettingstarted,methods,tipsandtricks}}

echo "Step 1: Creating category files with simplified labels..."

# Main category file
cat > "$RDP_ROOT/_category_.json" << 'EOF'
{
  "label": "Remote Desktop Protocol Manager",
  "position": 7,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

# Manual category
cat > "$RDP_ROOT/manual/_category_.json" << 'EOF'
{
  "label": "Manual",
  "position": 1,
  "collapsed": false,
  "collapsible": true
}
EOF

# Manual subcategories
cat > "$RDP_ROOT/manual/gettingtoknow/_category_.json" << 'EOF'
{
  "label": "Getting to Know RDP Manager",
  "position": 1,
  "collapsed": false,
  "collapsible": true
}
EOF

cat > "$RDP_ROOT/manual/configuration/_category_.json" << 'EOF'
{
  "label": "Configuration",
  "position": 2,
  "collapsed": false,
  "collapsible": true
}
EOF

# Tech Notes category
cat > "$RDP_ROOT/knowledgebase/_category_.json" << 'EOF'
{
  "label": "Tech Notes",
  "position": 2,
  "collapsed": false,
  "collapsible": true
}
EOF

# Videos category
cat > "$RDP_ROOT/videolearningcenter/_category_.json" << 'EOF'
{
  "label": "Videos",
  "position": 3,
  "collapsed": false,
  "collapsible": true
}
EOF

echo "Step 2: Copying and organizing files..."

# Copy main overview files
cp "$RDP_SOURCE/overview.md" "$RDP_ROOT/"
cp "$RDP_SOURCE/overview_1.md" "$RDP_ROOT/manual/gettingtoknow/"

# Copy getting to know files
cp "$RDP_SOURCE/gettingtoknowrdpmana/policiessettings.md" "$RDP_ROOT/manual/gettingtoknow/"
cp "$RDP_SOURCE/gettingtoknowrdpmana/importrdpfile.md" "$RDP_ROOT/manual/gettingtoknow/"

# Copy item level targeting to configuration
cp "$RDP_SOURCE/itemleveltargeting/overview.md" "$RDP_ROOT/manual/configuration/itemleveltargeting.md"
cp "$RDP_SOURCE/itemleveltargeting/processorderprecedence.md" "$RDP_ROOT/manual/configuration/"
cp "$RDP_SOURCE/itemleveltargeting/exportcollections.md" "$RDP_ROOT/manual/configuration/"

echo "Step 3: Creating overview pages..."

# Main overview
cat > "$RDP_ROOT/overview.md" << 'EOF'
---
title: "Remote Desktop Protocol Manager Overview"
description: "Remote Desktop Protocol Manager allows you to manage RDP settings and configurations"
sidebar_position: 1
---

# Remote Desktop Protocol Manager

Remote Desktop Protocol Manager enables you to configure and manage Remote Desktop Protocol settings across your organization.

## Quick Links

### 📖 [Manual](./manual/)
Complete documentation for using Remote Desktop Protocol Manager:
- **Getting to Know RDP Manager** - Basic concepts and interface
- **Configuration** - Advanced settings and item-level targeting

### 🎥 [Videos](./videolearningcenter/) 
Video tutorials and demonstrations:
- Getting Started guides
- Configuration methods
- Tips and tricks

### 🔧 [Tech Notes](./knowledgebase/)
Technical information and troubleshooting:
- Installation guides
- Troubleshooting common issues
- Tips and tricks

## Key Features

- Centralized RDP configuration management
- Item-level targeting for precise control  
- Integration with Group Policy and MDM
- Support for multiple deployment methods

Start with the [Manual](./manual/) section to learn the basics, then explore specific topics as needed.
EOF

echo "✅ RDP Manager reorganized with 7 files"
echo "📁 New location: /endpointpolicymanager/remotedesktopprotocolmanager/"

echo ""
echo "=== Now applying magic formula for links ==="

# Map and fix ALL links pointing to RDP Manager at once
echo "Fixing ALL links pointing to old RDP Manager location..."

find "$DOCS_ROOT" -name "*.md" -type f -exec sed -i \
  -e 's|/docs/endpointpolicymanager/manuals/desktopautomationand/remotedesktopprotoco/|/docs/endpointpolicymanager/remotedesktopprotocolmanager/manual/|g' \
  {} +

echo "✅ All links updated in single pass"

echo ""
echo "=== RDP Manager Reorganization Complete! ==="
echo ""
echo "📊 Summary:"
echo "  • 7 files reorganized into clean structure"
echo "  • Simplified navigation labels applied"  
echo "  • All internal links updated comprehensively"
echo "  • Ready for server restart"
echo ""
echo "🔗 New URL: /endpointpolicymanager/remotedesktopprotocolmanager/"
echo ""
echo "⚠️  IMPORTANT: Restart development server to see changes:"
echo "   npx kill-port 4500 && npm run start"