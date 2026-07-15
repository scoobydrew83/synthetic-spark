Here are the release notes for version 0.1.0:

---

## Overview

Version 0.1.0 establishes the synthetic-spark Salesforce project, delivering foundational account and contact automation alongside a new custom Widget object. This release also introduces a deployment tooling integration (SFDT) that adds environment management, pull caching, and AI-assisted release management to the team's workflow.

## What's New

- **Account and Contact Automation** — New automation logic for managing account records and contact data is now available for deployment. Test classes are included and verified.
- **Synthetic Widget Object** — A new custom object (`Synthetic_Widget__c`) with Status and Priority fields is included in the release package.
- **Deployment Tooling (SFDT)** — The project now ships with a configured deployment tool that supports multiple environments, parallel metadata pulls with caching, and AI-assisted release workflows. Teams can define environment targets and configure deployment behavior without editing core project files.
- **Release Management** — Automated release management is enabled, including a structured release notes directory and manifest-driven deployments.
- **Salesforce API Version 62.0** — The project targets Salesforce API version 62.0 across all components.

## Bug Fixes

- **Code Coverage Threshold Corrected** — The deployment process previously used a different coverage minimum than the test configuration. Both are now aligned at 85%, preventing deployments from succeeding with insufficient test coverage.

## Deployment Notes

- The release package includes two Apex classes and their test classes, plus the `Synthetic_Widget__c` custom object. Ensure the target org is provisioned to receive custom objects before deploying.
- An 85% code coverage threshold will be enforced at deployment time. Confirm coverage meets this bar in the target sandbox before promoting to production.
- If using SFDT for deployment, configure your environment targets in the SFDT environments file before running any release commands.