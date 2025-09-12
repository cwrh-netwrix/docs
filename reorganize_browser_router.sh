#!/bin/bash

# Browser Router Reorganization Script
# This script reorganizes Browser Router documentation from current scattered structure
# to a clean top-level organization under /endpointpolicymanager/browserrouter/

set -e  # Exit on any error

DOCS_ROOT="C:/GITLOCAL/docs/docs/endpointpolicymanager"
NEW_BR_ROOT="$DOCS_ROOT/browserrouter"

echo "=== Browser Router Reorganization Script ==="
echo "Creating new top-level Browser Router structure..."

# Step 1: Create new directory structure
echo "Step 1: Creating new directory structure..."
mkdir -p "$NEW_BR_ROOT"
mkdir -p "$NEW_BR_ROOT/manual"
mkdir -p "$NEW_BR_ROOT/manual/gettingtoknow"
mkdir -p "$NEW_BR_ROOT/manual/understandingdefaultbrowser"
mkdir -p "$NEW_BR_ROOT/manual/configuration"
mkdir -p "$NEW_BR_ROOT/manual/internetexplorer"
mkdir -p "$NEW_BR_ROOT/videolearningcenter"
mkdir -p "$NEW_BR_ROOT/videolearningcenter/gettingstarted"
mkdir -p "$NEW_BR_ROOT/videolearningcenter/methods"
mkdir -p "$NEW_BR_ROOT/videolearningcenter/tipsandtricks"
mkdir -p "$NEW_BR_ROOT/videolearningcenter/citrixvirtualapps"
mkdir -p "$NEW_BR_ROOT/knowledgebase"
mkdir -p "$NEW_BR_ROOT/knowledgebase/installation"
mkdir -p "$NEW_BR_ROOT/knowledgebase/troubleshooting"
mkdir -p "$NEW_BR_ROOT/knowledgebase/tipsandtricks"

# Step 2: Create main category file for Browser Router
echo "Step 2: Creating main Browser Router category file..."
cat > "$NEW_BR_ROOT/_category_.json" << 'EOF'
{
  "label": "Browser Router",
  "position": 5,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

# Step 3: Move and organize Manual content
echo "Step 3: Moving manual content..."

# Copy main manual files to appropriate sections
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/overview.md" "$NEW_BR_ROOT/manual/overview.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/overview_1.md" "$NEW_BR_ROOT/manual/gettingtoknow/overview_1.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/overview_2.md" "$NEW_BR_ROOT/manual/gettingtoknow/overview_2.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/navigation.md" "$NEW_BR_ROOT/manual/gettingtoknow/navigation.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/osweb.md" "$NEW_BR_ROOT/manual/understandingdefaultbrowser/osweb.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/rules.md" "$NEW_BR_ROOT/manual/configuration/rules.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/processorderprecedence.md" "$NEW_BR_ROOT/manual/configuration/processorderprecedence.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/itemleveltargeting.md" "$NEW_BR_ROOT/manual/configuration/itemleveltargeting.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/commandlinearguments.md" "$NEW_BR_ROOT/manual/configuration/commandlinearguments.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/ports.md" "$NEW_BR_ROOT/manual/configuration/ports.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/block.md" "$NEW_BR_ROOT/manual/configuration/block.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/custom.md" "$NEW_BR_ROOT/manual/configuration/custom.md"
cp "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/exportcollections.md" "$NEW_BR_ROOT/manual/configuration/exportcollections.md"

# Copy Internet Explorer specific content
cp -r "$DOCS_ROOT/manuals/appsbrowsersandjavas/browserrouter/internetexplorer/"* "$NEW_BR_ROOT/manual/internetexplorer/"

# Step 4: Move Video Learning Center content
echo "Step 4: Moving video learning center content..."
cp "$DOCS_ROOT/knowledgebase/browserrouter/videolearningcenter/videolearningcenter.md" "$NEW_BR_ROOT/videolearningcenter/videolearningcenter.md"

# Copy getting started videos
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/videolearningcenter/gettingstarted/"* "$NEW_BR_ROOT/videolearningcenter/gettingstarted/"

# Copy methods videos  
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/videolearningcenter/methods/"* "$NEW_BR_ROOT/videolearningcenter/methods/"

# Copy tips and tricks videos
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/videolearningcenter/tipsandtricks/"* "$NEW_BR_ROOT/videolearningcenter/tipsandtricks/"

# Copy citrix virtual apps videos
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/videolearningcenter/citrixvirtualapps/"* "$NEW_BR_ROOT/videolearningcenter/citrixvirtualapps/"

# Step 5: Move Knowledge Base / Technical Notes content
echo "Step 5: Moving knowledge base content..."
cp "$DOCS_ROOT/knowledgebase/browserrouter/knowledgebase/knowledgebase.md" "$NEW_BR_ROOT/knowledgebase/knowledgebase.md"

# Copy installation content
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/knowledgebase/installation/"* "$NEW_BR_ROOT/knowledgebase/installation/"

# Copy troubleshooting content
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/knowledgebase/troubleshooting/"* "$NEW_BR_ROOT/knowledgebase/troubleshooting/"

# Copy tips and tricks content
cp -r "$DOCS_ROOT/knowledgebase/browserrouter/knowledgebase/tipsandtricks/"* "$NEW_BR_ROOT/knowledgebase/tipsandtricks/"

# Step 6: Create category files for new structure
echo "Step 6: Creating category files..."

# Manual categories
cat > "$NEW_BR_ROOT/manual/_category_.json" << 'EOF'
{
  "label": "Browser Router Manual",
  "position": 1,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$NEW_BR_ROOT/manual/gettingtoknow/_category_.json" << 'EOF'
{
  "label": "Getting to know Browser Router",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/manual/understandingdefaultbrowser/_category_.json" << 'EOF'
{
  "label": "Understanding Default Browser Policies",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/manual/configuration/_category_.json" << 'EOF'
{
  "label": "Configuration",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/manual/internetexplorer/_category_.json" << 'EOF'
{
  "label": "Internet Explorer",
  "position": 4,
  "collapsed": true,
  "collapsible": true
}
EOF

# Video Learning Center categories
cat > "$NEW_BR_ROOT/videolearningcenter/_category_.json" << 'EOF'
{
  "label": "Browser Router Video Learning Center",
  "position": 2,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "videolearningcenter"
  }
}
EOF

cat > "$NEW_BR_ROOT/videolearningcenter/gettingstarted/_category_.json" << 'EOF'
{
  "label": "Getting Started",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/videolearningcenter/methods/_category_.json" << 'EOF'
{
  "label": "Methods: Cloud, MDM and SCCM",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/videolearningcenter/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/videolearningcenter/citrixvirtualapps/_category_.json" << 'EOF'
{
  "label": "Citrix Virtual Apps",
  "position": 4,
  "collapsed": true,
  "collapsible": true
}
EOF

# Knowledge Base categories
cat > "$NEW_BR_ROOT/knowledgebase/_category_.json" << 'EOF'
{
  "label": "Browser Router Technical Notes",
  "position": 3,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "knowledgebase"
  }
}
EOF

cat > "$NEW_BR_ROOT/knowledgebase/installation/_category_.json" << 'EOF'
{
  "label": "Installation and Uninstallation",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/knowledgebase/troubleshooting/_category_.json" << 'EOF'
{
  "label": "Troubleshooting",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$NEW_BR_ROOT/knowledgebase/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

# Step 7: Create main Browser Router overview file
echo "Step 7: Creating main overview file..."
cat > "$NEW_BR_ROOT/overview.md" << 'EOF'
---
title: Browser Router Overview
description: Browser Router helps you route specific websites to specific browsers automatically
---

# Browser Router

Browser Router is a powerful component of Endpoint Policy Manager (PolicyPak) that automatically routes websites to the appropriate browser based on rules you define. This ensures users always use the right browser for the right website, improving compatibility and security.

## Key Features

- **Automatic Browser Routing**: Route websites to specific browsers based on URL patterns
- **Default Browser Management**: Control which browser opens by default
- **Legacy Application Support**: Ensure legacy web applications work with Internet Explorer
- **Cross-Browser Compatibility**: Support for Chrome, Firefox, Edge, and Internet Explorer
- **Enterprise Integration**: Works with Group Policy, MDM, and Cloud management

## Getting Started

- [Browse the Manual](manual/overview) - Comprehensive documentation
- [Watch Videos](videolearningcenter/videolearningcenter) - Video tutorials and demonstrations  
- [Technical Notes](knowledgebase/knowledgebase) - Installation, troubleshooting, and tips

## Quick Links

- [Understanding Browser Routing Rules](manual/configuration/rules)
- [Installation Guide](knowledgebase/installation)
- [Troubleshooting Guide](knowledgebase/troubleshooting)
- [Getting Started Videos](videolearningcenter/gettingstarted)
EOF

echo "=== Browser Router reorganization completed successfully! ==="
echo "New structure created at: $NEW_BR_ROOT"
echo ""
echo "Summary:"
echo "- Manual content organized into logical sections"
echo "- Video content maintained with better categorization"  
echo "- Technical notes consolidated for easier access"
echo "- All category files and navigation updated"
echo ""
echo "Note: Original files are preserved. You may want to remove them after verifying the new structure works correctly."