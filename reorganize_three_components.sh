#!/bin/bash

# Three Components Reorganization Script
# This script reorganizes File Associations Manager, Device Manager, and Scripts and Triggers Manager
# from scattered structure to clean top-level organization

set -e  # Exit on any error

DOCS_ROOT="C:/GITLOCAL/docs/docs/endpointpolicymanager"

echo "=== Three Components Reorganization Script ==="
echo "Reorganizing: File Associations Manager, Device Manager, Scripts and Triggers Manager"

#####################################################################
# PART 1: FILE ASSOCIATIONS MANAGER
#####################################################################

echo ""
echo "🔧 PART 1: FILE ASSOCIATIONS MANAGER"
echo "======================================"

FAM_ROOT="$DOCS_ROOT/fileassociationsmanager"

echo "Creating File Associations Manager structure..."
mkdir -p "$FAM_ROOT"
mkdir -p "$FAM_ROOT/manual"
mkdir -p "$FAM_ROOT/manual/gettingtoknow"
mkdir -p "$FAM_ROOT/manual/configuration"
mkdir -p "$FAM_ROOT/videolearningcenter"
mkdir -p "$FAM_ROOT/videolearningcenter/gettingstarted"
mkdir -p "$FAM_ROOT/videolearningcenter/methods"
mkdir -p "$FAM_ROOT/videolearningcenter/tipsandtricks"
mkdir -p "$FAM_ROOT/knowledgebase"
mkdir -p "$FAM_ROOT/knowledgebase/installation"
mkdir -p "$FAM_ROOT/knowledgebase/troubleshooting"
mkdir -p "$FAM_ROOT/knowledgebase/tipsandtricks"

# Copy manual content
echo "Moving File Associations Manager manual content..."
cp "$DOCS_ROOT/manuals/windows10and11manage/fileassociations/fileassociations/overview.md" "$FAM_ROOT/manual/overview.md"
cp "$DOCS_ROOT/manuals/windows10and11manage/fileassociations/fileassociations/logs.md" "$FAM_ROOT/manual/configuration/logs.md"
cp "$DOCS_ROOT/manuals/windows10and11manage/fileassociations/fileassociations/xmlfile.md" "$FAM_ROOT/manual/configuration/xmlfile.md"

# Copy knowledge base content
echo "Moving File Associations Manager knowledge base content..."
if [ -f "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/knowledgebase.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/knowledgebase.md" "$FAM_ROOT/knowledgebase/knowledgebase.md"
fi

# Copy tips and tricks
if [ -d "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/tipsandtricks" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/tipsandtricks/"* "$FAM_ROOT/knowledgebase/tipsandtricks/" 2>/dev/null || true
fi

# Copy troubleshooting
if [ -d "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/troubleshooting" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/fileassociationsmanager/knowledgebase/troubleshooting/"* "$FAM_ROOT/knowledgebase/troubleshooting/" 2>/dev/null || true
fi

# Copy video content
echo "Moving File Associations Manager video content..."
if [ -f "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/videolearningcenter.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/videolearningcenter.md" "$FAM_ROOT/videolearningcenter/videolearningcenter.md"
fi

# Copy video subdirectories
if [ -d "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/gettingstarted" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/gettingstarted/"* "$FAM_ROOT/videolearningcenter/gettingstarted/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/methods" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/methods/"* "$FAM_ROOT/videolearningcenter/methods/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/tipsandtricks" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/fileassociationsmanager/videolearningcenter/tipsandtricks/"* "$FAM_ROOT/videolearningcenter/tipsandtricks/" 2>/dev/null || true
fi

#####################################################################
# PART 2: DEVICE MANAGER
#####################################################################

echo ""
echo "🔧 PART 2: DEVICE MANAGER"
echo "========================="

DM_ROOT="$DOCS_ROOT/devicemanager"

echo "Creating Device Manager structure..."
mkdir -p "$DM_ROOT"
mkdir -p "$DM_ROOT/manual"
mkdir -p "$DM_ROOT/manual/gettingtoknow"
mkdir -p "$DM_ROOT/manual/configuration"
mkdir -p "$DM_ROOT/videolearningcenter"
mkdir -p "$DM_ROOT/videolearningcenter/gettingstarted"
mkdir -p "$DM_ROOT/videolearningcenter/methods"
mkdir -p "$DM_ROOT/knowledgebase"
mkdir -p "$DM_ROOT/knowledgebase/installation"
mkdir -p "$DM_ROOT/knowledgebase/troubleshooting"
mkdir -p "$DM_ROOT/knowledgebase/tipsandtricks"

# Copy manual content
echo "Moving Device Manager manual content..."
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/overview.md" "$DM_ROOT/manual/overview.md"
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/devicemanagerpolicies.md" "$DM_ROOT/manual/gettingtoknow/devicemanagerpolicies.md"
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/globaldevicemanager.md" "$DM_ROOT/manual/gettingtoknow/globaldevicemanager.md"
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/helpertool.md" "$DM_ROOT/manual/configuration/helpertool.md"
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/rules.md" "$DM_ROOT/manual/configuration/rules.md"
cp "$DOCS_ROOT/manuals/devicemanagementpak/devicemanager/troubleshooting.md" "$DM_ROOT/knowledgebase/troubleshooting/troubleshooting.md"

# Copy knowledge base content
echo "Moving Device Manager knowledge base content..."
if [ -f "$DOCS_ROOT/knowledgebase/devicemanager/knowledgebase/knowledgebase.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/devicemanager/knowledgebase/knowledgebase.md" "$DM_ROOT/knowledgebase/knowledgebase.md"
fi

# Copy video content
echo "Moving Device Manager video content..."
if [ -f "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/videolearningcenter.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/videolearningcenter.md" "$DM_ROOT/videolearningcenter/videolearningcenter.md"
fi

# Copy video subdirectories
if [ -d "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/gettingstarted" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/gettingstarted/"* "$DM_ROOT/videolearningcenter/gettingstarted/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/methods" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/devicemanager/videolearningcenter/methods/"* "$DM_ROOT/videolearningcenter/methods/" 2>/dev/null || true
fi

#####################################################################
# PART 3: SCRIPTS AND TRIGGERS MANAGER
#####################################################################

echo ""
echo "🔧 PART 3: SCRIPTS AND TRIGGERS MANAGER"
echo "======================================="

STM_ROOT="$DOCS_ROOT/scriptstriggers"

echo "Creating Scripts and Triggers Manager structure..."
mkdir -p "$STM_ROOT"
mkdir -p "$STM_ROOT/manual"
mkdir -p "$STM_ROOT/manual/gettingtoknow"
mkdir -p "$STM_ROOT/manual/configuration"
mkdir -p "$STM_ROOT/manual/itemleveltargeting"
mkdir -p "$STM_ROOT/videolearningcenter"
mkdir -p "$STM_ROOT/videolearningcenter/gettingstarted"
mkdir -p "$STM_ROOT/videolearningcenter/methods"
mkdir -p "$STM_ROOT/videolearningcenter/tipsandtricks"
mkdir -p "$STM_ROOT/videolearningcenter/triggersexamples"
mkdir -p "$STM_ROOT/videolearningcenter/withcloud"
mkdir -p "$STM_ROOT/knowledgebase"
mkdir -p "$STM_ROOT/knowledgebase/installation"
mkdir -p "$STM_ROOT/knowledgebase/troubleshooting"
mkdir -p "$STM_ROOT/knowledgebase/tipsandtricks"

# Copy manual content
echo "Moving Scripts and Triggers Manager manual content..."
cp "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/overview.md" "$STM_ROOT/manual/overview.md"
cp "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/overview_1.md" "$STM_ROOT/manual/gettingtoknow/overview_1.md"
cp "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/advantages.md" "$STM_ROOT/manual/gettingtoknow/advantages.md"
cp "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/insouts.md" "$STM_ROOT/manual/configuration/insouts.md"

# Copy manual subdirectories
if [ -d "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/gettoknow" ]; then
    cp -r "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/gettoknow/"* "$STM_ROOT/manual/gettingtoknow/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/itemleveltargeting" ]; then
    cp -r "$DOCS_ROOT/manuals/desktopautomationand/scriptstriggers/itemleveltargeting/"* "$STM_ROOT/manual/itemleveltargeting/" 2>/dev/null || true
fi

# Copy knowledge base content
echo "Moving Scripts and Triggers Manager knowledge base content..."
if [ -f "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/knowledgebase.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/knowledgebase.md" "$STM_ROOT/knowledgebase/knowledgebase.md"
fi

# Copy knowledge base subdirectories
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/tipandtricks" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/tipandtricks/"* "$STM_ROOT/knowledgebase/tipsandtricks/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/troubleshooting" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/knowledgebase/troubleshooting/"* "$STM_ROOT/knowledgebase/troubleshooting/" 2>/dev/null || true
fi

# Copy video content
echo "Moving Scripts and Triggers Manager video content..."
if [ -f "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/videolearningcenter.md" ]; then
    cp "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/videolearningcenter.md" "$STM_ROOT/videolearningcenter/videolearningcenter.md"
fi

# Copy video subdirectories
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/gettingstarted" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/gettingstarted/"* "$STM_ROOT/videolearningcenter/gettingstarted/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/methods" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/methods/"* "$STM_ROOT/videolearningcenter/methods/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/tipsandtricks" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/tipsandtricks/"* "$STM_ROOT/videolearningcenter/tipsandtricks/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/triggersexamples" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/triggersexamples/"* "$STM_ROOT/videolearningcenter/triggersexamples/" 2>/dev/null || true
fi
if [ -d "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/withcloud" ]; then
    cp -r "$DOCS_ROOT/knowledgebase/scriptstriggers/videolearningcenter/withcloud/"* "$STM_ROOT/videolearningcenter/withcloud/" 2>/dev/null || true
fi

#####################################################################
# PART 4: CREATE CATEGORY FILES FOR ALL COMPONENTS
#####################################################################

echo ""
echo "📁 PART 4: CREATING CATEGORY FILES"
echo "================================="

# File Associations Manager Categories
echo "Creating File Associations Manager category files..."

cat > "$FAM_ROOT/_category_.json" << 'EOF'
{
  "label": "File Associations Manager",
  "position": 6,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$FAM_ROOT/manual/_category_.json" << 'EOF'
{
  "label": "Manual",
  "position": 1,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$FAM_ROOT/manual/gettingtoknow/_category_.json" << 'EOF'
{
  "label": "Getting to know File Associations Manager",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/manual/configuration/_category_.json" << 'EOF'
{
  "label": "Configuration",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/videolearningcenter/_category_.json" << 'EOF'
{
  "label": "Videos",
  "position": 2,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "videolearningcenter"
  }
}
EOF

cat > "$FAM_ROOT/videolearningcenter/gettingstarted/_category_.json" << 'EOF'
{
  "label": "Getting Started",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/videolearningcenter/methods/_category_.json" << 'EOF'
{
  "label": "Methods: Cloud, MDM and SCCM",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/videolearningcenter/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/knowledgebase/_category_.json" << 'EOF'
{
  "label": "Tech Notes",
  "position": 3,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "knowledgebase"
  }
}
EOF

cat > "$FAM_ROOT/knowledgebase/installation/_category_.json" << 'EOF'
{
  "label": "Installation and Uninstallation",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/knowledgebase/troubleshooting/_category_.json" << 'EOF'
{
  "label": "Troubleshooting",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$FAM_ROOT/knowledgebase/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

# Device Manager Categories
echo "Creating Device Manager category files..."

cat > "$DM_ROOT/_category_.json" << 'EOF'
{
  "label": "Device Manager",
  "position": 7,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$DM_ROOT/manual/_category_.json" << 'EOF'
{
  "label": "Manual",
  "position": 1,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$DM_ROOT/manual/gettingtoknow/_category_.json" << 'EOF'
{
  "label": "Getting to know Device Manager",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/manual/configuration/_category_.json" << 'EOF'
{
  "label": "Configuration",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/videolearningcenter/_category_.json" << 'EOF'
{
  "label": "Videos",
  "position": 2,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "videolearningcenter"
  }
}
EOF

cat > "$DM_ROOT/videolearningcenter/gettingstarted/_category_.json" << 'EOF'
{
  "label": "Getting Started",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/videolearningcenter/methods/_category_.json" << 'EOF'
{
  "label": "Methods: Cloud, MDM and SCCM",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/knowledgebase/_category_.json" << 'EOF'
{
  "label": "Tech Notes",
  "position": 3,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "knowledgebase"
  }
}
EOF

cat > "$DM_ROOT/knowledgebase/installation/_category_.json" << 'EOF'
{
  "label": "Installation and Uninstallation",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/knowledgebase/troubleshooting/_category_.json" << 'EOF'
{
  "label": "Troubleshooting",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$DM_ROOT/knowledgebase/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

# Scripts and Triggers Manager Categories
echo "Creating Scripts and Triggers Manager category files..."

cat > "$STM_ROOT/_category_.json" << 'EOF'
{
  "label": "Scripts and Triggers Manager",
  "position": 8,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$STM_ROOT/manual/_category_.json" << 'EOF'
{
  "label": "Manual",
  "position": 1,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "overview"
  }
}
EOF

cat > "$STM_ROOT/manual/gettingtoknow/_category_.json" << 'EOF'
{
  "label": "Getting to know Scripts and Triggers Manager",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/manual/configuration/_category_.json" << 'EOF'
{
  "label": "Configuration",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/manual/itemleveltargeting/_category_.json" << 'EOF'
{
  "label": "Item Level Targeting",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/videolearningcenter/_category_.json" << 'EOF'
{
  "label": "Videos",
  "position": 2,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "videolearningcenter"
  }
}
EOF

cat > "$STM_ROOT/videolearningcenter/gettingstarted/_category_.json" << 'EOF'
{
  "label": "Getting Started",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/videolearningcenter/methods/_category_.json" << 'EOF'
{
  "label": "Methods: Cloud, MDM and SCCM",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/videolearningcenter/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/videolearningcenter/triggersexamples/_category_.json" << 'EOF'
{
  "label": "Triggers Examples",
  "position": 4,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/videolearningcenter/withcloud/_category_.json" << 'EOF'
{
  "label": "With Cloud",
  "position": 5,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/knowledgebase/_category_.json" << 'EOF'
{
  "label": "Tech Notes",
  "position": 3,
  "collapsed": false,
  "collapsible": true,
  "link": {
    "type": "doc",
    "id": "knowledgebase"
  }
}
EOF

cat > "$STM_ROOT/knowledgebase/installation/_category_.json" << 'EOF'
{
  "label": "Installation and Uninstallation",
  "position": 1,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/knowledgebase/troubleshooting/_category_.json" << 'EOF'
{
  "label": "Troubleshooting",
  "position": 2,
  "collapsed": true,
  "collapsible": true
}
EOF

cat > "$STM_ROOT/knowledgebase/tipsandtricks/_category_.json" << 'EOF'
{
  "label": "Tips and Tricks",
  "position": 3,
  "collapsed": true,
  "collapsible": true
}
EOF

#####################################################################
# PART 5: CREATE OVERVIEW PAGES
#####################################################################

echo ""
echo "📄 PART 5: CREATING OVERVIEW PAGES"
echo "================================="

# File Associations Manager Overview Pages
echo "Creating File Associations Manager overview pages..."

cat > "$FAM_ROOT/overview.md" << 'EOF'
---
title: File Associations Manager Overview
description: File Associations Manager controls which applications open specific file types
---

# File Associations Manager

File Associations Manager is a component of Endpoint Policy Manager (PolicyPak) that allows administrators to control which applications open specific file types and protocols. This ensures consistent user experience and proper application usage across your organization.

## Key Features

- **File Type Control**: Define which applications open specific file extensions
- **Protocol Management**: Control URL protocol handlers (http, https, mailto, etc.)
- **Default Application Management**: Set organization-wide default applications
- **User Override Control**: Allow or prevent users from changing associations
- **Comprehensive Logging**: Track association changes and usage

## Documentation Sections

- [Manual](manual/overview) - Configuration guides and reference documentation
- [Videos](videolearningcenter/videolearningcenter) - Video tutorials and demonstrations
- [Tech Notes](knowledgebase/knowledgebase) - Troubleshooting and technical guidance

## Quick Links

- [Configuration Guide](manual/configuration)
- [Getting Started Videos](videolearningcenter/gettingstarted)
- [Troubleshooting](knowledgebase/troubleshooting)
EOF

cat > "$FAM_ROOT/manual/overview.md" << 'EOF'
---
title: File Associations Manager Manual
description: Complete guide to configuring File Associations Manager
---

# File Associations Manager Manual

This manual provides comprehensive information about File Associations Manager, a component that controls which applications open specific file types and protocols.

## Manual Sections

- [Getting to Know File Associations Manager](gettingtoknow) - Overview and basic concepts
- [Configuration](configuration) - Setup and management procedures

## Overview

File Associations Manager solves the common problem of ensuring the correct application opens when users double-click files or click links. Whether you need PDFs to always open in Adobe Acrobat or want to ensure mailto links use Outlook, File Associations Manager handles this automatically.

### Key Benefits

- **Consistent User Experience**: Same file types open with same applications across all computers
- **Security**: Prevent malicious files from opening with unintended applications  
- **Productivity**: Eliminate user confusion about which application to use
- **Compliance**: Ensure required applications are used for specific file types

### Getting Started

1. Start with [Getting to Know File Associations Manager](gettingtoknow) to understand the basics
2. Review [Configuration](configuration) to set up file associations and policies
EOF

cat > "$FAM_ROOT/videolearningcenter/videolearningcenter.md" << 'EOF'
---
title: File Associations Manager Videos
description: Video tutorials for File Associations Manager
---

# File Associations Manager Video Learning Center

Learn File Associations Manager through comprehensive video tutorials covering setup, configuration, and best practices.

## Video Categories

- [Getting Started](gettingstarted) - Basic concepts and initial setup
- [Methods: Cloud, MDM and SCCM](methods) - Deployment and management methods
- [Tips and Tricks](tipsandtricks) - Advanced techniques and best practices

## Featured Topics

### Getting Started
Perfect for administrators new to File Associations Manager who want to understand the fundamentals and see it in action.

### Deployment Methods
Learn how to deploy and manage File Associations Manager using different enterprise methods including Cloud, MDM, and SCCM.

### Advanced Techniques
Discover tips, tricks, and advanced configurations to maximize the effectiveness of File Associations Manager.

---

*All videos include step-by-step guidance and real-world examples.*
EOF

cat > "$FAM_ROOT/knowledgebase/knowledgebase.md" << 'EOF'
---
title: File Associations Manager Technical Notes
description: Technical documentation for File Associations Manager
---

# File Associations Manager Technical Notes

Technical documentation for File Associations Manager installation, troubleshooting, and advanced configuration.

## Technical Sections

- [Installation and Uninstallation](installation) - Setup procedures and requirements
- [Troubleshooting](troubleshooting) - Common issues and solutions
- [Tips and Tricks](tipsandtricks) - Advanced techniques and best practices

## Overview

File Associations Manager provides enterprise-level control over file type associations and protocol handlers. This technical documentation helps IT administrators implement, maintain, and troubleshoot the component.

## Common Topics

- File association XML configuration
- Registry modifications and impacts
- User vs. system-level associations
- Troubleshooting association conflicts
- Logging and diagnostics

---

*For additional support, consult the troubleshooting section or contact technical support.*
EOF

# Device Manager Overview Pages
echo "Creating Device Manager overview pages..."

cat > "$DM_ROOT/overview.md" << 'EOF'
---
title: Device Manager Overview
description: Device Manager controls hardware device access and restrictions
---

# Device Manager

Device Manager is a component of Endpoint Policy Manager (PolicyPak) that provides granular control over hardware devices and peripherals. It allows administrators to allow, block, or audit device usage to maintain security and compliance.

## Key Features

- **Device Control**: Allow or block specific hardware devices
- **USB Management**: Control USB storage devices, printers, and other peripherals
- **Audit Capabilities**: Track device usage and access attempts
- **Granular Policies**: Configure rules based on device type, vendor, or specific devices
- **User-Based Controls**: Different policies for different users or groups

## Documentation Sections

- [Manual](manual/overview) - Configuration guides and policy management
- [Videos](videolearningcenter/videolearningcenter) - Video tutorials and demonstrations
- [Tech Notes](knowledgebase/knowledgebase) - Technical guidance and troubleshooting

## Quick Links

- [Device Policies Configuration](manual/configuration/rules)
- [Getting Started Videos](videolearningcenter/gettingstarted)
- [Troubleshooting Guide](knowledgebase/troubleshooting)
EOF

cat > "$DM_ROOT/manual/overview.md" << 'EOF'
---
title: Device Manager Manual
description: Complete guide to configuring Device Manager policies
---

# Device Manager Manual

This manual provides comprehensive information about Device Manager, a component that controls hardware device access and restrictions in enterprise environments.

## Manual Sections

- [Getting to Know Device Manager](gettingtoknow) - Overview and basic concepts
- [Configuration](configuration) - Policy setup and device rules

## Overview

Device Manager addresses the security challenge of controlling hardware device access. Whether you need to prevent USB storage devices for data protection or allow specific printers while blocking others, Device Manager provides the necessary controls.

### Key Benefits

- **Data Loss Prevention**: Block unauthorized storage devices
- **Security Compliance**: Meet regulatory requirements for device control
- **Operational Control**: Allow business-required devices while blocking others
- **Audit Trail**: Track all device access attempts

### Getting Started

1. Review [Getting to Know Device Manager](gettingtoknow) for fundamental concepts
2. Configure policies using [Configuration](configuration) guides
EOF

cat > "$DM_ROOT/videolearningcenter/videolearningcenter.md" << 'EOF'
---
title: Device Manager Videos
description: Video tutorials for Device Manager
---

# Device Manager Video Learning Center

Learn Device Manager through video tutorials covering device policies, configuration, and enterprise deployment.

## Video Categories

- [Getting Started](gettingstarted) - Basic concepts and initial configuration
- [Methods: Cloud, MDM and SCCM](methods) - Deployment and management approaches

## Featured Topics

### Getting Started
Essential videos for administrators new to Device Manager, covering basic concepts and initial policy configuration.

### Deployment Methods
Learn how to deploy and manage Device Manager policies using various enterprise management platforms.

---

*All videos provide practical examples and step-by-step guidance for real-world implementations.*
EOF

cat > "$DM_ROOT/knowledgebase/knowledgebase.md" << 'EOF'
---
title: Device Manager Technical Notes
description: Technical documentation for Device Manager
---

# Device Manager Technical Notes

Technical documentation for Device Manager installation, configuration, and troubleshooting.

## Technical Sections

- [Installation and Uninstallation](installation) - Setup and deployment procedures
- [Troubleshooting](troubleshooting) - Issue resolution and diagnostics
- [Tips and Tricks](tipsandtricks) - Advanced configuration techniques

## Overview

Device Manager provides enterprise-grade device control capabilities. This technical documentation helps administrators implement effective device policies and resolve common issues.

## Key Technical Areas

- Device identification and classification
- Policy precedence and conflicts
- Registry and system integration
- Performance considerations
- Logging and monitoring

---

*Consult the troubleshooting section for common issues and solutions.*
EOF

# Scripts and Triggers Manager Overview Pages
echo "Creating Scripts and Triggers Manager overview pages..."

cat > "$STM_ROOT/overview.md" << 'EOF'
---
title: Scripts and Triggers Manager Overview
description: Scripts and Triggers Manager automates script execution based on system events
---

# Scripts and Triggers Manager

Scripts and Triggers Manager is a component of Endpoint Policy Manager (PolicyPak) that allows administrators to automatically execute scripts based on various system triggers and events. This enables powerful automation and customization capabilities.

## Key Features

- **Event-Based Automation**: Execute scripts based on system events, user actions, or schedules
- **Multiple Script Types**: Support for PowerShell, VBScript, Batch files, and executables
- **Flexible Triggers**: User logon/logoff, system startup/shutdown, application launch, and more
- **Conditional Execution**: Run scripts only when specific conditions are met
- **Comprehensive Logging**: Track script execution and results

## Documentation Sections

- [Manual](manual/overview) - Configuration guides and scripting reference
- [Videos](videolearningcenter/videolearningcenter) - Video tutorials and examples
- [Tech Notes](knowledgebase/knowledgebase) - Technical guidance and troubleshooting

## Quick Links

- [Script Configuration](manual/configuration)
- [Getting Started Videos](videolearningcenter/gettingstarted)
- [Trigger Examples](videolearningcenter/triggersexamples)
- [Troubleshooting](knowledgebase/troubleshooting)
EOF

cat > "$STM_ROOT/manual/overview.md" << 'EOF'
---
title: Scripts and Triggers Manager Manual
description: Complete guide to configuring Scripts and Triggers Manager
---

# Scripts and Triggers Manager Manual

This manual provides comprehensive information about Scripts and Triggers Manager, a component that automates script execution based on system events and triggers.

## Manual Sections

- [Getting to Know Scripts and Triggers Manager](gettingtoknow) - Overview and basic concepts
- [Configuration](configuration) - Script setup and trigger configuration
- [Item Level Targeting](itemleveltargeting) - Advanced targeting and filtering

## Overview

Scripts and Triggers Manager transforms static Group Policy environments into dynamic, responsive systems. By executing scripts automatically based on events and conditions, it enables sophisticated automation scenarios previously requiring complex solutions.

### Key Benefits

- **Automation**: Reduce manual administrative tasks
- **Responsiveness**: React to system events in real-time
- **Flexibility**: Support for multiple scripting languages and triggers
- **Targeting**: Execute scripts only for specific users, computers, or conditions

### Getting Started

1. Start with [Getting to Know Scripts and Triggers Manager](gettingtoknow) for fundamental concepts
2. Learn [Configuration](configuration) for setting up scripts and triggers
3. Use [Item Level Targeting](itemleveltargeting) for advanced deployment scenarios
EOF

cat > "$STM_ROOT/videolearningcenter/videolearningcenter.md" << 'EOF'
---
title: Scripts and Triggers Manager Videos
description: Video tutorials for Scripts and Triggers Manager
---

# Scripts and Triggers Manager Video Learning Center

Learn Scripts and Triggers Manager through comprehensive video tutorials covering scripting, triggers, and automation scenarios.

## Video Categories

- [Getting Started](gettingstarted) - Basic concepts and first scripts
- [Methods: Cloud, MDM and SCCM](methods) - Deployment across different platforms
- [Tips and Tricks](tipsandtricks) - Advanced techniques and best practices
- [Triggers Examples](triggersexamples) - Real-world trigger scenarios and scripts
- [With Cloud](withcloud) - Cloud-specific implementations and considerations

## Featured Topics

### Getting Started
Essential videos for administrators new to Scripts and Triggers Manager, covering basic concepts and creating your first automated scripts.

### Deployment Methods
Learn how to deploy Scripts and Triggers Manager using various enterprise platforms including traditional Group Policy, MDM, and Cloud management.

### Advanced Examples
Real-world examples of trigger scenarios including user logon automation, application-specific scripts, and system maintenance tasks.

### Cloud Integration
Specialized guidance for implementing Scripts and Triggers Manager in cloud environments and hybrid scenarios.

---

*All videos include practical examples and downloadable sample scripts.*
EOF

cat > "$STM_ROOT/knowledgebase/knowledgebase.md" << 'EOF'
---
title: Scripts and Triggers Manager Technical Notes
description: Technical documentation for Scripts and Triggers Manager
---

# Scripts and Triggers Manager Technical Notes

Technical documentation for Scripts and Triggers Manager installation, scripting, and troubleshooting.

## Technical Sections

- [Installation and Uninstallation](installation) - Setup and deployment procedures
- [Troubleshooting](troubleshooting) - Script debugging and issue resolution
- [Tips and Tricks](tipsandtricks) - Advanced scripting techniques

## Overview

Scripts and Triggers Manager provides powerful automation capabilities for enterprise environments. This technical documentation helps administrators implement effective scripting solutions and resolve common issues.

## Key Technical Areas

- Script execution contexts and permissions
- Trigger evaluation and timing
- Error handling and logging
- Performance optimization
- Security considerations
- Debugging techniques

---

*Consult the troubleshooting section for script debugging guidance and common issue resolution.*
EOF

echo ""
echo "=== Three Components Reorganization Complete! ==="
echo ""
echo "📊 Summary:"
echo "✅ File Associations Manager: $(find "$FAM_ROOT" -name "*.md" | wc -l) files organized"
echo "✅ Device Manager: $(find "$DM_ROOT" -name "*.md" | wc -l) files organized" 
echo "✅ Scripts and Triggers Manager: $(find "$STM_ROOT" -name "*.md" | wc -l) files organized"
echo ""
echo "📁 New locations created:"
echo "  • /endpointpolicymanager/fileassociationsmanager/"
echo "  • /endpointpolicymanager/devicemanager/"
echo "  • /endpointpolicymanager/scriptstriggers/"
echo ""
echo "⚠️  NEXT STEPS REQUIRED:"
echo "1. Verify the new structures work correctly"
echo "2. Remove old directories to eliminate duplicate URLs"
echo "3. Restart development server to rebuild routing"
echo ""
echo "📝 Note: All original files are preserved for verification"