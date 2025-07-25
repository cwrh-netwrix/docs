---
sidebar_position: 1
title: PingCastle KPI User Guide
description: Complete visual guide to understanding and using PingCastle KPIs
keywords: [KPI, Active Directory, Security, Dashboard, Monitoring]
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# PingCastle KPI User Guide

## 🚀 Quick Start: Your First 5 Minutes

Welcome to PingCastle's Key Performance Indicator (KPI) system! This guide will help you understand and navigate your Active Directory security metrics.

<Tabs>
<TabItem value="login" label="1. Login">

![Login Screen](/img/product_docs/pingcastle/kpi-user-guide/01-login-screen.png)

Access your PingCastle dashboard using any of the available authentication methods:
- **Local Account**: Use your PingCastle username and password
- **Windows Authentication**: Use your domain credentials
- **External Services**: SAML, Okta, or other configured providers

</TabItem>
<TabItem value="dashboard" label="2. Dashboard">

![Main Dashboard](/img/product_docs/pingcastle/kpi-user-guide/02-main-dashboard.png)

Once logged in, you'll see the **Maturity Assessment** dashboard - your main KPI hub.

</TabItem>
<TabItem value="navigate" label="3. Navigate">

![Navigation](/img/product_docs/pingcastle/kpi-user-guide/04-breadcrumb-navigation.png)

Use the breadcrumb navigation and menu system to explore different KPI categories.

</TabItem>
</Tabs>

:::tip Getting Started
Start by reviewing the three main email goals, then explore the detailed KPI categories to understand your current security posture.
:::

---

## 📊 Understanding Your KPIs - Business Guide

PingCastle tracks **20 Key Performance Indicators** across **5 categories** to measure your Active Directory security maturity:

### 🎯 Category 1.1 - Domain Coverage (How well are you monitoring?)

#### **KPI 1.1.1 - Audit Coverage Percentage**
- **What it means**: Percentage of your domains that PingCastle is actively monitoring
- **Business impact**: Blind spots in security monitoring mean unknown risks  
- **Target**: 80% or higher (Higher is better)
- **Example**: If you have 100 domains and 15 haven't been audited, your coverage is 85%
- **Where to find**: Dashboard → Domain coverage → Top-left tile

#### **KPI 1.1.2 - Unaudited Domains**
- **What it means**: Exact count of domains that have never been scanned
- **Business impact**: Each unaudited domain is a potential security blind spot
- **Target**: 0 domains (Lower is better)
- **Action needed**: Deploy PingCastle agents to unmonitored domains
- **Where to find**: Dashboard → Domain coverage → Top-right tile

#### **KPI 1.1.3 - PingCastle Versions in Use**
- **What it means**: Number of different PingCastle software versions deployed
- **Business impact**: Too many versions indicates inconsistent tooling and potential security gaps
- **Target**: ≤ 3 versions (Lower is better)
- **Example**: Domain-A uses v2.8.1, Domain-B uses v2.9.0, Domain-C uses v2.10.1 = 3 versions
- **Where to find**: Dashboard → Domain coverage → Version distribution tile

#### **KPI 1.1.4 - Stale Audited Domains**
- **What it means**: Number of domains with reports older than 1 month
- **Business impact**: Outdated reports mean you might miss recent security changes
- **Target**: Minimize stale reports (Lower is better)
- **Action needed**: Schedule regular scans for stale domains
- **Where to find**: Dashboard → Domain coverage → Audit freshness tile

### 🏢 Category 1.2 - Domain Management (How organized is your infrastructure?)

#### **KPI 1.2.1 - Domains in Default Entity**
- **What it means**: Number of domains not assigned to specific business units
- **Business impact**: Poor organization makes it harder to track ownership and responsibility
- **Target**: Minimize unassigned domains (Lower is better)
- **Action needed**: Assign domains to appropriate organizational entities

#### **KPI 1.2.2 - Auto-Created Domains**
- **What it means**: Number of domains discovered automatically but not manually validated
- **Business impact**: May indicate unknown or unmanaged domain expansion
- **Target**: Minimize auto-created domains (Lower is better)
- **Action needed**: Review and manually validate auto-discovered domains

#### **KPI 1.2.3 - Exception Percentage**
- **What it means**: Percentage of domains with approved security exceptions
- **Business impact**: High exceptions may indicate systemic issues or over-permissive policies
- **Target**: ≤ 20% (Lower is better)
- **Formula**: (Domains with exceptions × 100) ÷ Total domain count

#### **KPI 1.2.4 - Unsupported Functional Levels**
- **What it means**: Number of domains running outdated Windows versions (≤ 2008)
- **Business impact**: Indicates outdated infrastructure with known security vulnerabilities
- **Target**: 0 domains (Lower is better)
- **Action needed**: Upgrade domains to supported functional levels

### 🔗 Category 1.3 - External Trust Relationships (How secure are your external connections?)

#### **KPI 1.3.1 - Trusts to Auto-Created Domains Without Reports**
- **What it means**: Number of trust connections to unmonitored auto-discovered domains
- **Business impact**: Potential security risks from connections to unknown domains
- **Target**: 0 trusts (Lower is better)
- **Action needed**: Monitor or remove risky trust relationships

#### **KPI 1.3.2 - Trusts to Out-of-Scope Domains**
- **What it means**: Number of trust connections to domains outside your security scope
- **Business impact**: Connections to domains you don't control or monitor
- **Target**: Minimize out-of-scope trusts (Lower is better)
- **Action needed**: Review necessity of external trust relationships

#### **KPI 1.3.3 - Trusts to Removed Domains**
- **What it means**: Number of trust connections to decommissioned domains
- **Business impact**: Orphaned trusts that should be cleaned up
- **Target**: 0 trusts (Lower is better)
- **Action needed**: Remove obsolete trust relationships

#### **KPI 1.3.4 - Unsafe Trusts to Unscanned Domains**
- **What it means**: Number of unprotected trusts to completely unknown domains
- **Business impact**: **CRITICAL SECURITY RISK** - unprotected trusts to unknown domains
- **Target**: 0 trusts (Lower is better)
- **Action needed**: **IMMEDIATE** - Add SID filtering or remove these trusts

### 🛡️ Category 2.1 - Trust Security (How well are your trust relationships protected?)

#### **KPI 2.1.1 - Domains with Perfect Trust Score**
- **What it means**: Number of domains achieving optimal trust security (100/100 score)
- **Business impact**: Shows excellence in trust relationship security configuration
- **Target**: Maximize perfect scores (Higher is better)
- **Action needed**: Use these domains as security models for others

#### **KPI 2.1.2 - Trusts Without SID Filtering**
- **What it means**: Number of trust relationships lacking SID filtering protection
- **Business impact**: **MAJOR SECURITY VULNERABILITY** - allows potential privilege escalation attacks
- **Target**: 0 trusts (Lower is better)
- **Action needed**: **HIGH PRIORITY** - Enable SID filtering on all trusts

#### **KPI 2.1.3 - SID Filtering Migration in Progress**
- **What it means**: Percentage of trusts currently being upgraded to SID filtering
- **Business impact**: Shows active security improvement progress
- **Target**: ≤ 10% (Lower is better - indicates fast completion)
- **Formula**: (Trusts migrating × 100) ÷ Total trusts

#### **KPI 2.1.4 - Domains with Unsafe SID History**
- **What it means**: Number of domains with problematic SID history configurations
- **Business impact**: Potential privilege escalation risks through SID history abuse
- **Target**: 0 domains (Lower is better)
- **Action needed**: Review and clean up SID history entries

### ⚠️ Category 2.2 - Risk Score Management (How secure are your domains overall?)

:::warning Understanding Risk Scores
These KPIs are **cumulative** - each higher level includes all lower levels. Focus on reducing the highest risk categories first.
:::

#### **KPI 2.2.1 - Critical Risk Domains (Score = 100)**
- **What it means**: Number of domains with maximum security risk
- **Business impact**: **CRITICAL PRIORITY** - immediate security incidents likely
- **Target**: 0 domains (Lower is better)
- **Action needed**: **EMERGENCY** - Isolate and remediate immediately

#### **KPI 2.2.2 - High Risk Domains (Score > 75)**
- **What it means**: Critical domains (100) + Additional high-risk domains (76-99)
- **Business impact**: Second priority - significant security concerns
- **Target**: Minimize high-risk domains (Lower is better)
- **Action needed**: Weekly remediation plan

#### **KPI 2.2.3 - Medium Risk Domains (Score > 50)**
- **What it means**: High-risk domains + Additional medium-risk domains (51-75)
- **Business impact**: Moderate priority - monitor and improve over time
- **Target**: Minimize medium+ risk domains (Lower is better)
- **Action needed**: Monthly improvement targets

#### **KPI 2.2.4 - Low Risk Domains (Score > 25)**
- **What it means**: Medium+ risk domains + Additional low-risk domains (26-50)
- **Business impact**: Goal is to get ALL domains to ≤ 25 score
- **Target**: Minimize domains above 25 score (Lower is better)
- **Goal state**: Only domains with scores ≤ 25 are considered "good"

---

## 📧 Your Weekly KPI Email Deep Dive

:::info Email Timing
KPI emails are sent weekly every Monday at 6 AM by default. The exact time can be configured in the PingCastle Enterprise appsettings.json file using the "MondayHour" setting (e.g., "MondayHour": 8 for 8 AM delivery). The WeeklyKPIRecording service handles the automated scheduling and delivery of these emails.
:::

### Email Structure Overview

![Full Email Layout](/img/product_docs/pingcastle/kpi-user-guide/weekly-kpi-email-full.png)

Your weekly KPI email provides a comprehensive overview of your Active Directory security posture with actionable insights.

### The Three Main Goals

![Three Goals Visualization](/img/product_docs/pingcastle/kpi-user-guide/email-three-goals.png)

Your email focuses on three critical objectives that form the foundation of AD security:

#### 🎯 Goal 1: Audit All Your Domains
- **Green checkmark (✅)**: All domains in your scope are being monitored
- **Red X (❌)**: At least one domain lacks recent security assessment
- **What this means**: You have complete visibility into your AD infrastructure
- **If red**: Deploy PingCastle agents to unmonitored domains immediately

#### 🛡️ Goal 2: Use SID Filtering on All Trusts  
- **Green checkmark (✅)**: All trust relationships have SID filtering protection
- **Red X (❌)**: At least one trust lacks SID filtering protection
- **What this means**: Your trust relationships are protected from privilege escalation
- **If red**: Review and enable SID filtering on unsafe trusts - **HIGH PRIORITY**

#### 📊 Goal 3: Lower Your Risk Score
- **Four colored bars**: Show your risk score distribution across all domains
  - 🟢 **Green (0-25)**: Good security posture - maintain this level
  - 🟡 **Yellow (25-50)**: Needs attention - plan improvements
  - 🟠 **Orange (50-75)**: High priority - allocate resources immediately  
  - 🔴 **Red (75-100)**: Critical - emergency response required

### Understanding the Domain Details Table

![Domain Table](/img/product_docs/pingcastle/kpi-user-guide/email-domain-table.png)

The detailed table shows each domain with five key indicators:

| Column | What It Shows | Good (✅) | Concerning (❌) |
|--------|---------------|-----------|-----------------|
| **Name** | Domain identifier with link to full report | - | - |
| **Audited** | Recent security scan status | Recent scan completed | No recent scan |
| **Trust Protected** | SID filtering status | SID filtering active | Vulnerable trusts exist |
| **Maturity** | Security level (1-5 scale) | 4-5 (Blue/Green) | 1-2 (Red/Orange) |
| **Risk Score** | Individual domain risk gauge | Low score (Green) | High score (Red) |

### Email Goal Status Icons Explained

![Goal Status Icons](/img/product_docs/pingcastle/kpi-user-guide/email-goal-status-icons.png)

- **✅ Green Checkmark**: Goal achieved - maintain current practices
- **❌ Red X**: Goal not met - action required
- **Color-coded bars**: Risk distribution showing priority areas

---

## 🎯 Finding Your KPIs in the Dashboard

### Navigation Overview

The PingCastle dashboard organizes KPIs into logical categories that match your security workflow:

![Entity Dropdown](/img/product_docs/pingcastle/kpi-user-guide/03-entity-dropdown.png)

:::tip Entity Filtering
Use the **Entity dropdown** (top-right) to filter KPIs by organizational unit. This is essential for large organizations with multiple business units.
:::

### KPI Category 1.1 - Domain Coverage

:::note Navigation Path
**Dashboard → Domain coverage**
:::

![Domain Coverage Page](/img/product_docs/pingcastle/kpi-user-guide/05-domain-coverage-1-1.png)

This page shows how well you're monitoring your AD infrastructure with four key tiles:

#### **Finding KPI 1.1.1 - Audit Coverage Percentage**
- **Location**: Top-left tile on Domain coverage page
- **What the gauge shows**: Green = good coverage, Red = poor coverage
- **Click action**: See list of unaudited domains
- **Good value**: 80% or higher

![KPI 1.1.1 Tile](/img/product_docs/pingcastle/kpi-user-guide/13-kpi-111-audit-coverage.png)

#### **Finding KPI 1.1.2 - Unaudited Domains**  
- **Location**: Top-right tile on Domain coverage page
- **What the number shows**: Exact count of domains needing agents
- **Click action**: Drill down to see which specific domains
- **Good value**: 0 domains

### KPI Category 1.2 - Domain Management

:::note Navigation Path
**Dashboard → Ownership**
:::

![Domain Management Page](/img/product_docs/pingcastle/kpi-user-guide/07-domain-management-1-2.png)

This page shows how well-organized your domain infrastructure is.

### KPI Category 1.3 - External Trusts

:::note Navigation Path
**Dashboard → External Trusts**
:::

![External Trusts Page](/img/product_docs/pingcastle/kpi-user-guide/08-external-trusts-1-3.png)

This page identifies potentially risky external trust relationships.

### KPI Category 2.1 - Trust Security

:::note Navigation Path
**Dashboard → Internal Trusts** 
:::

![Internal Trusts Page](/img/product_docs/pingcastle/kpi-user-guide/09-internal-trusts-2-1.png)

This page shows how well your trust relationships are secured, particularly focusing on SID filtering.

#### **Finding KPI 2.1.2 - SID Filtering Not Activated**
- **Critical security metric**: Shows unprotected trust relationships
- **Location**: Main tile on Internal Trusts page
- **Target**: 0 trusts without SID filtering
- **Priority**: **HIGH** - Major security vulnerability

![KPI 2.1.2 Tile](/img/product_docs/pingcastle/kpi-user-guide/15-kpi-212-sid-filtering.png)

### KPI Category 2.2 - Risk Score

:::note Navigation Path
**Dashboard → Risk Score**
:::

![Risk Score Page](/img/product_docs/pingcastle/kpi-user-guide/10-risk-score-2-2.png)

This page shows the overall security health of your domains using the four-tier risk pyramid.

#### **Finding KPI 2.2.1 - Critical Risk Domains**
- **Most important security metric**: Domains requiring immediate attention
- **Location**: First tile on Risk Score page  
- **Target**: 0 critical risk domains
- **Priority**: **EMERGENCY** - Immediate action required

![KPI 2.2.1 Tile](/img/product_docs/pingcastle/kpi-user-guide/16-kpi-221-critical-risk.png)

:::warning Critical Risk Response
When KPI 2.2.1 shows any value > 0, this indicates domains with maximum security risk. These require immediate isolation and remediation to prevent security incidents.
:::

---

## 📊 Understanding KPI Visualizations

### KPI Tile Structure

![KPI Tile Breakdown](/img/product_docs/pingcastle/kpi-user-guide/17-kpi-tile-structure.png)

Each KPI tile contains five key elements:

1. **📊 Current Value**: The main metric (large, bold number)
2. **🎯 Gauge Chart**: Visual representation of performance against targets
3. **📈 Trend Arrow**: Shows if the metric is improving, declining, or stable
   - ↗️ **Green arrow**: Improving (good)
   - ↘️ **Red arrow**: Declining (concerning)  
   - ➡️ **Gray arrow**: Stable (no change)
4. **📝 Title**: What the KPI measures
5. **🔗 Click Action**: Drill down to see contributing factors

### Reading Gauge Colors

![Gauge Color Examples](/img/product_docs/pingcastle/kpi-user-guide/gauge-colors-example.png)

The color coding across all KPI gauges follows a consistent pattern:

- 🟢 **Green**: Meeting targets - maintain current practices
- 🟡 **Yellow**: Needs attention - plan improvements
- 🔴 **Red**: Critical - immediate action required

### Maturity Level Stars

![Maturity Stars](/img/product_docs/pingcastle/kpi-user-guide/12-maturity-stars-navigation.png)

Each KPI category shows a maturity level using 1-4 stars:
- ⭐ **1 Star**: Initial - significant improvements needed
- ⭐⭐ **2 Stars**: Managed - making progress
- ⭐⭐⭐ **3 Stars**: Defined - good practices in place  
- ⭐⭐⭐⭐ **4 Stars**: Optimized - excellent security posture

### Historical Trends

![History View](/img/product_docs/pingcastle/kpi-user-guide/11-history-tab-view.png)

**How to access**: Click the "History" tab on any KPI category page

**What it shows**:
- Month-over-month KPI changes
- Trend lines showing improvement or decline
- Seasonal patterns in your security metrics

**Actions you can take**:
- **Export to Excel**: Create management reports
- **Identify patterns**: Correlate KPI changes with infrastructure changes
- **Track progress**: Measure improvement over time

### Drill-Down Functionality

![Drill Down Example](/img/product_docs/pingcastle/kpi-user-guide/19-drill-down-example.png)

**How to use**: Click any KPI tile to see underlying details

**What you'll see**:
- List of specific domains contributing to the KPI
- Detailed breakdown of issues
- Direct links to individual domain reports
- Filtering options to focus on specific problems

### Export and Reporting

![Export Functionality](/img/product_docs/pingcastle/kpi-user-guide/20-export-functionality.png)

**Available exports**:
- **Excel spreadsheets**: For detailed analysis and reporting
- **PDF reports**: For executive summaries
- **Historical data**: For trend analysis
- **Filtered views**: Export data for specific entities or time periods

---

## 🔧 Common KPI Scenarios & Solutions

### Scenario 1: New Domain Discovered

<Tabs>
<TabItem value="problem" label="❌ Problem Identified">

**Symptoms you'll see**:
- KPI 1.2.2 (Auto-Created Domains) increases unexpectedly
- Email alerts about unmanaged domains
- "New domain found" notifications

*Screenshot placeholder: High auto-created domain count example*

**What this means**:
- PingCastle discovered a domain through trust relationships or network scanning
- The domain hasn't been manually validated or assigned to a business unit
- This could be legitimate expansion or an unknown security risk

</TabItem>
<TabItem value="investigation" label="🔍 Investigation Steps">

**Immediate actions**:
1. **Verify legitimacy**: Check if the domain belongs to your organization
2. **Check trust relationships**: See how PingCastle discovered this domain
3. **Contact network team**: Confirm if this is planned infrastructure
4. **Review discovery logs**: Understand when and how it was found

**Red flags to watch for**:
- Domains with suspicious names
- Domains not matching your naming conventions
- Domains appearing during non-business hours
- Multiple unknown domains discovered simultaneously

</TabItem>
<TabItem value="solution" label="✅ Resolution Actions">

**For legitimate domains**:
1. **Assign ownership**: Move from default entity to appropriate business unit
2. **Deploy monitoring**: Install PingCastle agent for security assessment
3. **Configure alerts**: Set up notifications for this domain
4. **Document**: Update your domain inventory and ownership records

*Screenshot placeholder: Resolved auto-created domain example*

**For suspicious domains**:
1. **Isolate**: Block network access if possible
2. **Investigate**: Perform deep security analysis
3. **Remove trusts**: Disconnect any trust relationships
4. **Report**: Document as potential security incident

</TabItem>
</Tabs>

### Scenario 2: Critical Risk Score Alert

:::warning Critical Alert Priority
When KPI 2.2.1 (Critical Risk Domains) > 0, this requires **immediate attention**. Critical risk domains have maximum security vulnerabilities and pose imminent threat to your organization.
:::

**Investigation workflow**:

1. **Access the dashboard**: Navigate to Dashboard → Risk Score
2. **Click Critical Risk tile**: See which domains have 100/100 risk scores
3. **Review domain details**: For each critical domain:
   - Click the domain name to view detailed security report
   - Review specific rule violations (usually multiple high-severity issues)
   - Check when the domain last changed from lower risk to critical
4. **Prioritize by business impact**: Focus on domains that:
   - Contain sensitive data or critical applications
   - Have many users or administrative accounts
   - Connect to other important systems

**Immediate response actions**:
- **Isolate if necessary**: Consider network isolation for extremely compromised domains
- **Emergency patching**: Apply critical security updates immediately
- **Review admin accounts**: Audit and secure privileged access
- **Monitor closely**: Increase logging and monitoring for these domains
- **Stakeholder notification**: Inform business owners and security team

**Follow-up actions**:
- **Weekly remediation plan**: Create structured approach to fix all identified issues
- **Root cause analysis**: Understand how the domain reached critical risk level
- **Prevention measures**: Implement controls to prevent future critical risk situations

### Scenario 3: SID Filtering Security Gap

**Symptoms**:
- KPI 2.1.2 (Trusts Without SID Filtering) > 0
- Email Goal 2 shows red X status
- Security audit findings about trust vulnerabilities

**Why this is critical**:
- SID filtering prevents privilege escalation attacks across trust boundaries
- Without SID filtering, attackers can potentially gain admin access to trusted domains
- This is considered a **major security vulnerability** by security frameworks

**Remediation process**:

<Tabs>
<TabItem value="assessment" label="1. Assessment">

**Identify affected trusts**:
1. Navigate to Dashboard → Internal Trusts
2. Click KPI 2.1.2 tile to see unprotected trusts
3. Document each trust relationship:
   - Source and target domains
   - Business purpose of the trust
   - Age and last modification date
   - Current trust type and direction

**Risk evaluation**:
- **High risk**: Trusts to external organizations
- **Medium risk**: Trusts between business units
- **Lower risk**: Trusts within same organizational boundary

</TabItem>
<TabItem value="planning" label="2. Planning">

**For each unprotected trust, choose**:

**Option A: Enable SID Filtering**
- Best for trusts that must remain active
- Requires testing to ensure no application impact
- Can be done gradually during maintenance windows

**Option B: Remove Trust**
- Best for unnecessary or obsolete trusts
- Simpler and more secure solution
- Requires business stakeholder approval

**Option C: Temporary Exception**
- Only for trusts that cannot be immediately changed
- Must have documented business justification
- Requires additional monitoring and controls

</TabItem>
<TabItem value="implementation" label="3. Implementation">

**SID Filtering enablement**:
1. **Test environment**: Enable SID filtering in test environment first
2. **Application testing**: Verify all applications work correctly
3. **User testing**: Confirm user access remains functional
4. **Production deployment**: Enable during maintenance window
5. **Monitor**: Watch for any access issues after enablement

**Trust removal**:
1. **Stakeholder approval**: Get business sign-off for trust removal
2. **Impact analysis**: Document any applications or users affected
3. **Alternative solutions**: Implement alternative access methods if needed
4. **Removal**: Delete the trust relationship
5. **Verification**: Confirm trust removal doesn't break critical functions

</TabItem>
</Tabs>

### Scenario 4: Poor Audit Coverage

**Symptoms**:
- KPI 1.1.1 (Audit Coverage) < 80%
- KPI 1.1.2 (Unaudited Domains) > 0
- Email Goal 1 shows red X status

**Common root causes**:
- **Agent deployment failures**: PingCastle agents not installed correctly
- **Network connectivity issues**: Agents can't communicate with central server
- **Permission problems**: Agents lack necessary Active Directory permissions
- **Resource constraints**: Target systems don't have sufficient resources
- **Firewall blocks**: Network security blocking agent communication

**Systematic improvement approach**:

1. **Inventory phase**:
   - Export complete list of domains that should be monitored
   - Identify which domains have never been scanned
   - Categorize by business unit and criticality

2. **Deployment phase**:
   - Install PingCastle agents on unmonitored domains
   - Verify agent connectivity and permissions
   - Test initial scan functionality

3. **Configuration phase**:
   - Set up automated reporting schedules
   - Configure appropriate scan frequency based on domain criticality
   - Enable notifications for scan failures

4. **Monitoring phase**:
   - Track agent health and scan success rates
   - Set up alerts for agent failures or missed scans
   - Regular review of coverage metrics

5. **Maintenance phase**:
   - Regular agent updates and patches
   - Capacity planning for growing infrastructure
   - Documentation updates for new domains

**Quick wins for immediate improvement**:
- **Focus on critical domains first**: Ensure your most important domains are monitored
- **Batch deployment**: Install agents on multiple similar domains simultaneously  
- **Automated deployment**: Use group policy or configuration management tools
- **Template configurations**: Create standard agent configurations for consistency

---

## 🏢 Managing Multiple Entities

For large organizations with multiple business units, PingCastle provides entity-based management to organize and filter KPI data.

### Using the Entity Filter

![Entity Dropdown](/img/product_docs/pingcastle/kpi-user-guide/03-entity-dropdown.png)

**How to use entity filtering**:

1. **Access the dropdown**: Click the "Entity" dropdown in the top-right of any dashboard page
2. **Select scope**: Choose a specific business unit or "All data" for global view
3. **View filtered data**: All KPIs automatically filter to your selection
4. **Switch context**: Change entities to compare performance across business units

### Entity-Specific Views

![Entity Filtered View](/img/product_docs/pingcastle/kpi-user-guide/21-entity-specific-view.png)

**Benefits of entity filtering**:

- **Focus on responsibility**: See only KPIs relevant to your area of control
- **Compare performance**: Benchmark one business unit against others
- **Targeted notifications**: Receive emails only for domains you manage
- **Delegated administration**: Allow business units to self-manage their security metrics

**Setting up entity management**:

1. **Configure entities**: Define organizational units in PingCastle admin settings
2. **Assign domains**: Move domains from default entity to appropriate business units
3. **Set permissions**: Configure who can view and manage each entity's data
4. **Notification setup**: Configure entity-specific email recipients

**Best practices for entity management**:

- **Clear ownership**: Each domain should have a designated business owner
- **Regular reviews**: Quarterly reviews of entity assignments and ownership
- **Cross-entity issues**: Establish escalation process for issues affecting multiple entities
- **Shared resources**: Define how shared infrastructure (like root domains) is managed

---

## 🔍 Troubleshooting Common Issues

### KPI Values Don't Match Expectations

:::tip Quick Check
The most common cause of unexpected KPI values is incorrect entity filtering. Always verify the Entity dropdown is set correctly.
:::

*Screenshot placeholder: Entity filter troubleshooting example*

**Step-by-step resolution**:

1. **Check entity filter**: Verify you're viewing the correct organizational scope
2. **Verify data freshness**: Look for "Last KPI Computation" timestamp on dashboard
3. **Confirm recent reports**: Ensure domains have recent PingCastle reports
4. **Check date ranges**: Some KPIs use specific time windows for calculations
5. **Review domain scope**: Confirm domains are marked as active (not removed/out-of-scope)

**Advanced troubleshooting**:
- **Force KPI recalculation**: Admin users can trigger manual KPI computation
- **Check calculation logs**: Review system logs for KPI computation errors
- **Verify database integrity**: Ensure underlying data is consistent
- **Compare with raw data**: Cross-reference KPI values with source reports

### Email Notifications Not Received

**Common causes and solutions**:

| Issue | Symptoms | Resolution |
|-------|----------|------------|
| **User assignment** | Only some users get emails | Add user to entity ownership in admin settings |
| **Email preferences** | User gets some emails but not KPI ones | Check notification settings in user profile |
| **SMTP configuration** | No one gets emails | Verify email server settings in appsettings.json |
| **Spam filtering** | Emails go to spam folder | Add PingCastle email address to safe senders |
| **Schedule disabled** | No weekly emails sent | Check MondayHour setting in appsettings.json |

*Screenshot placeholder: Email settings configuration*

**Detailed resolution steps**:

1. **Check user assignments**:
   - Navigate to admin settings → Users
   - Verify user is assigned to correct entities
   - Confirm user has appropriate permissions

2. **Verify email preferences**:
   - Go to user profile → Notifications
   - Enable KPI email notifications
   - Set appropriate frequency and format

3. **Test email delivery**:
   - Send test email from PingCastle admin panel
   - Check email server logs for delivery issues
   - Verify recipient email addresses are correct

4. **Review configuration**:
   - Check appsettings.json email configuration
   - Verify SMTP server connectivity
   - Test authentication credentials

### Dashboard Performance Issues

**Optimization strategies**:

1. **Use entity filtering**: Reduce data volume by selecting specific business units
2. **Limit date ranges**: Focus on recent data rather than full historical views
3. **Close unused tabs**: Browser performance can impact dashboard loading
4. **Clear browser cache**: Resolve display issues with cached resources
5. **Check network connectivity**: Slow connections affect dashboard responsiveness

**Performance best practices**:
- **Regular maintenance**: Keep browser updated and clear cache monthly
- **Optimal viewing**: Use recommended browsers (Chrome, Firefox, Edge)
- **Network considerations**: Ensure adequate bandwidth for dashboard usage
- **System resources**: Close unnecessary applications when using intensive dashboard features

### Inconsistent KPI Calculations

**Validation process**:

1. **Export raw data**: Use Excel export to get underlying KPI calculations
2. **Manual verification**: Verify calculations using KPI definitions from this guide
3. **Check time consistency**: Ensure comparing data from same time periods
4. **Compare scope**: Verify global vs entity-specific calculations are appropriate
5. **Review edge cases**: Check for special conditions that might affect calculations

**When to escalate**:
- **Persistent inconsistencies**: Values that don't match despite troubleshooting
- **Calculation errors**: Mathematical errors in KPI formulas
- **Missing data**: KPIs showing no data when domains are active
- **Performance degradation**: Dashboard becoming unusably slow

---

## 📈 Best Practices for KPI Management

### Daily Operations

- **Morning KPI check**: Review critical KPI alerts within 4 hours of receiving them
- **Focus on trends**: Monitor trend direction, not just absolute values
- **Use entity filtering**: Focus analysis on your area of responsibility
- **Document actions**: Keep log of remediation actions taken for audit trail

### Weekly Reviews

- **Email analysis**: Thoroughly review weekly KPI email for each managed entity
- **Historical comparison**: Compare current week to previous month for trend analysis
- **Pattern identification**: Look for emerging issues or improvements
- **Stakeholder updates**: Provide progress updates to business stakeholders

### Monthly Planning

- **Comprehensive analysis**: Export KPI history for detailed trend analysis
- **Target setting**: Establish improvement targets for following month
- **Resource allocation**: Plan staffing and budget based on KPI priorities
- **Process review**: Evaluate and adjust KPI monitoring processes

### Quarterly Assessment

- **Performance review**: Comprehensive evaluation of KPI system effectiveness
- **Benchmarking**: Compare performance against industry standards and peers
- **System improvements**: Plan enhancements to KPI monitoring and reporting
- **Training needs**: Identify areas where staff need additional KPI training

---

## 🎓 Training and Development

### New User Onboarding Checklist

- [ ] Complete this User Guide walkthrough
- [ ] Review KPI Reference Guide for technical definitions
- [ ] Practice navigating dashboard with non-production data
- [ ] Shadow experienced users during weekly KPI reviews
- [ ] Understand entity filtering and organizational structure
- [ ] Learn escalation procedures for critical KPI alerts

### Advanced User Development

- [ ] Master custom reporting and trend analysis
- [ ] Develop entity-specific KPI strategies and targets
- [ ] Learn to correlate KPI changes with infrastructure events
- [ ] Practice root cause analysis for KPI deterioration
- [ ] Contribute to KPI system improvements and automation

### Management Reporting Skills

- [ ] Focus on trend direction over absolute values in reports
- [ ] Provide business context for technical KPI changes
- [ ] Include realistic timelines and resource requirements
- [ ] Highlight successful improvements and lessons learned
- [ ] Develop executive-friendly KPI dashboards and summaries

---

## 📞 Getting Help

### Documentation Resources

- **KPI Reference Guide**: Technical definitions and calculation formulas
- **Technical Implementation Guide**: Advanced configuration and customization
- **User Forums**: Community discussions and best practices
- **Video Tutorials**: Step-by-step visual guides for common tasks

### Support Escalation

For issues not resolved by this guide:

1. **Check system logs**: Review PingCastle logs for error messages
2. **Gather evidence**: Screenshot the issue and note exact steps to reproduce
3. **Contact administrators**: Work with your PingCastle system administrators
4. **Submit support request**: Include detailed problem description and system information

### Contributing to Documentation

Help improve this guide by:
- Reporting unclear or outdated information
- Suggesting additional scenarios or use cases  
- Sharing best practices from your organization
- Contributing screenshots for missing visualizations

---

*This guide covers the essential aspects of PingCastle KPI usage. For technical implementation details and advanced configuration, refer to the Technical Implementation Guide.*