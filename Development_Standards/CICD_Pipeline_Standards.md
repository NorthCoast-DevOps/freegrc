# Continuous Integration/Continuous Deployment (CI/CD) Pipeline Standards

## 1. Purpose
This document outlines the CI/CD pipeline standards for the company, leveraging GitHub, GitHub Actions, Semgrep, and Dependabot to ensure efficient, secure, and compliant software delivery.

## 2. CI/CD Pipeline Overview
The CI/CD pipeline includes various environments and processes designed to automate deployment and integration. The environments are as follows:

- **Local**: Development and testing on local machines.
- **Development**: An integration environment where code is built and tested.
- **UAT (User Acceptance Testing)** (Optional): A pre-staging environment for end-user validation.
- **Staging**: A mirror of production for final testing before deployment.
- **Production**: The live environment accessible to end-users.

### 2.1 Optional Features
- **Ephemeral Environments**: Development, UAT, and staging environments can be created and destroyed as needed.
- **Plug-and-Play Code Scanning Utilities**: Flexible integrations for additional security scanning tools.

## 3. CI/CD Processes

### 3.1 Code Quality and Scanning
- **Semgrep**: Runs lightly at 7 AM UTC with results uploaded as artifacts.
- **Super Linter**: Executes on each push to ensure code quality.
- **Code Formatting Tool**: Enforced on each push to maintain code style.

### 3.2 Secrets and Environment Variables Management
- Secrets and environment variables are managed using GitHub’s environment variables and secrets attached to the repository.
- Developers have access to modify local and development environments, while further environments require DevOps/Operations intervention.
- Automated checks verify that no secrets or variables are missing in higher environments compared to previous stages. Builds fail automatically if discrepancies are found, and notifications are sent to DevOps/Operations and the requesting engineer.

#### Contingency
If there is no dedicated DevOps/Operations team:
- A different developer must approve and merge any PR, triggering deployment.
- Secrets and variables must be entered by the originating developer before the PR is requested.
- No secrets should be shared on Slack or other platforms unless an approved, secure method is in place.
- Production builds require managerial approval in GitHub before deployment.

### 3.3 Notifications
- Pipelines utilize Slack (or the preferred messaging platform) for notifications, with messages sent to a designated channel.
- Direct messages are sent to the originator or DevOps/Operations in case of a failure in higher environments.
- Email notifications of successful builds are sent to all relevant teams.

### 3.4 Production Builds
- Production builds trigger after a release creation, promoting consistency and traceability in deployments.

#### Benefits of Releases
Releases help with:
- Providing clear deployment version markers.
- Allowing for easy rollback.
- Organizing features and fixes for clarity.

### 3.5 Build and Artifact Management
- All build processes and container image creation occur only in the development stage, with images or packages copied to higher environments to ensure consistency.
- Each deployment dynamically creates an artifact named `./doc/build.txt`, containing the current build’s tag/version number and environment name. It’s accessible at `$SITE_URL/doc/build.txt` on live sites.

### 3.6 Security Checkpoints Before Production
- Additional scans or manual reviews are mandated before production deployment to provide a final security defense.

### 3.7 Audit Trails
- All actions (pull requests, merges, etc.) are logged to ensure compliance, particularly for SOC 2, HIPAA, and HiTRUST.

### 3.8 Testing Coverage Enforcement
- A minimum testing coverage threshold (e.g., 80%) is required for code promotion to higher environments.

### 3.9 Rollback Strategy
- A documented rollback plan for production deployments will detail steps and responsible parties for reversing a failed deployment.

### 3.10 Vulnerability Retesting
- For identified high-severity vulnerabilities, a protocol mandates re-scanning and verifying resolution before build promotion.

## 4. Compliance and Governance
### 4.1 Compliance Frameworks
The outlined processes support compliance with SOC 2, HIPAA, and HiTRUST, helping ensure secure, auditable, and compliant CI/CD practices.

### 4.2 Security Framework Controls
The following controls are supported:
- **SOC 2**: Security, Availability, and Confidentiality
- **HIPAA**: Administrative, Physical, and Technical safeguards
- **HiTRUST**: Comprehensive security framework integration

## 5. Addendum: Software and Solutions Used

| Software/Solution   | Cost                   | Description                                                  | Benefits                                   |
|---------------------|------------------------|--------------------------------------------------------------|--------------------------------------------|
| **GitHub**          | Free (with paid plans) | Version control platform hosting code repositories.          | Supports collaboration, code review, and history tracking. |
| **GitHub Actions**  | Free (with usage limits) | CI/CD tool integrated with GitHub for automating workflows. | Streamlines build, test, and deployment processes. |
| **Semgrep**         | Free                   | Static analysis tool for code security and quality.          | Enables code scanning to identify vulnerabilities. |
| **Dependabot**      | Free                   | Automates dependency updates in repositories.                | Ensures libraries are up-to-date and secure. |
| **Slack**           | Free (with paid plans) | Instant messaging platform for team communication.           | Facilitates real-time collaboration and notifications. |
| **Other Tools**     | Optional               | Additional tools for security scanning or CI/CD enhancements. | Provides flexibility in adapting the pipeline. |

## 6. Addendum: Compliance and Governance

| Solution            | Compliance Assistance                         | Security Framework Controls                    |
|---------------------|-----------------------------------------------|------------------------------------------------|
| **GitHub**          | Provides audit trails and change logs.        | SOC 2, HIPAA                                  |
| **GitHub Actions**  | Automates compliance checks in CI/CD.         | SOC 2, HiTRUST                                |
| **Semgrep**         | Identifies vulnerabilities for security compliance. | SOC 2, HIPAA, HiTRUST                      |
| **Dependabot**      | Maintains updated, secure dependencies.       | SOC 2, HIPAA                                  |
| **Slack**           | Enables timely compliance notifications.      | SOC 2, HIPAA                                  |
