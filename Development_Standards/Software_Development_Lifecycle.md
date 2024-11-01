# SDLC Standards

## 1. Overview
This document outlines the standards and guidelines for the Software Development Life Cycle (SDLC) within our organization. It aims to ensure a consistent and efficient approach to software development that aligns with best practices and compliance requirements.

## 2. SDLC Phases
The SDLC consists of the following phases:

- **Planning:** Define project scope and objectives. Identify resources, timelines, and budget. Conduct a feasibility analysis.
- **Requirements Gathering:** Collect and document functional and non-functional requirements. Engage stakeholders through interviews, surveys, and workshops. Create a requirements specification document.
- **Design:** Develop system architecture and design specifications. Create wireframes and prototypes as needed. Review design documents with stakeholders for approval.
- **Development:** Implement code according to design specifications. Follow coding standards and best practices. Conduct unit testing to ensure code quality.
- **Testing:** Execute functional, integration, system, and user acceptance testing (UAT). Identify, document, and resolve defects. Obtain stakeholder approval before moving to production.
- **Deployment:** Prepare deployment plans and rollback strategies. Deploy to production and monitor for issues. Ensure proper documentation is available for support teams.
- **Maintenance:** Provide ongoing support and maintenance for deployed applications. Implement updates and enhancements as needed. Monitor application performance and user feedback.

## 3. Continuous Integration/Continuous Deployment (CI/CD) Pipeline Overview
This document also outlines the CI/CD pipeline standards for the company, leveraging GitHub, GitHub Actions, Semgrep, and Dependabot to ensure efficient, secure, and compliant software delivery. The CI/CD pipeline includes various environments and processes designed to automate deployment and integration:

- **Local:** Development and testing on local machines.
- **Development:** An integration environment where code is built and tested.
- **UAT (User Acceptance Testing) (Optional):** A pre-staging environment for end-user validation.
- **Staging:** A mirror of production for final testing before deployment.
- **Production:** The live environment accessible to end-users.

### 3.1 Optional Features
- **Ephemeral Environments:** Development, UAT, and staging environments can be created and destroyed as needed.
- **Plug-and-Play Code Scanning Utilities:** Flexible integrations for additional security scanning tools.

## 4. CI/CD Processes
### 4.1 Code Quality and Scanning
To maintain high code quality, several processes are in place:
- **Semgrep** runs lightly at 7 AM UTC with results uploaded as artifacts.
- **Super Linter** executes on each push to ensure code quality.
- A **Code Formatting Tool** is enforced on each push to maintain code style.

### 4.2 Secrets and Environment Variables Management
Secrets and environment variables are managed using GitHub’s environment variables and secrets attached to the repository. Developers have access to modify local and development environments, while further environments require DevOps/Operations intervention. Automated checks verify that no secrets or variables are missing in higher environments compared to previous stages. Builds will fail automatically if discrepancies are found, and notifications are sent to DevOps/Operations and the requesting engineer.

#### Contingency
If there is no dedicated DevOps/Operations team, a different developer must approve and merge any pull request (PR), triggering deployment. Secrets and variables must be entered by the originating developer before the PR is requested. No secrets should be shared on Slack or other platforms unless an approved, secure method is in place. Production builds require managerial approval in GitHub before deployment.

### 4.3 Notifications
Pipelines utilize Slack (or the preferred messaging platform) for notifications, with messages sent to a designated channel. Direct messages are sent to the originator or DevOps/Operations in case of a failure in higher environments. Email notifications of successful builds are sent to all relevant teams.

### 4.4 Production Builds
Production builds are triggered after a release creation, promoting consistency and traceability in deployments. 

#### Benefits of Releases
Releases help with:
- Providing clear deployment version markers.
- Allowing for easy rollback.
- Organizing features and fixes for clarity.

### 4.5 Build and Artifact Management
All build processes and container image creation occur only in the development stage, with images or packages copied to higher environments to ensure consistency. Each deployment dynamically creates an artifact named `./doc/build.txt`, containing the current build’s tag/version number and environment name, accessible at `$SITE_URL/doc/build.txt` on live sites.

### 4.6 Security Checkpoints Before Production
Additional scans or manual reviews are mandated before production deployment to provide a final security defense.

### 4.7 Audit Trails
All actions (pull requests, merges, etc.) are logged to ensure compliance, particularly for SOC 2, HIPAA, and HiTRUST.

### 4.8 Testing Coverage Enforcement
A minimum testing coverage threshold (e.g., 80%) is required for code promotion to higher environments.

### 4.9 Rollback Strategy
A documented rollback plan for production deployments will detail steps and responsible parties for reversing a failed deployment.

### 4.10 Vulnerability Retesting
For identified high-severity vulnerabilities, a protocol mandates re-scanning and verifying resolution before build promotion.

## 5. Compliance and Governance
### 5.1 Compliance Frameworks
The outlined processes support compliance with SOC 2, HIPAA, and HiTRUST, helping ensure secure, auditable, and compliant CI/CD practices.

### 5.2 Security Framework Controls
The following controls are supported:
- **SOC 2:** Security, Availability, and Confidentiality
- **HIPAA:** Administrative, Physical, and Technical safeguards
- **HiTRUST:** Comprehensive security framework integration

## 6. Addendum: Software and Solutions Used
| Software/Solution   | Cost                   | Description                                                  | Benefits                                   |
|---------------------|------------------------|--------------------------------------------------------------|--------------------------------------------|
| **GitHub**          | Free (with paid plans) | Version control platform hosting code repositories.          | Supports collaboration, code review, and history tracking. |
| **GitHub Actions**  | Free (with usage limits) | CI/CD tool integrated with GitHub for automating workflows. | Streamlines build, test, and deployment processes. |
| **Semgrep**         | Free                   | Static analysis tool for code security and quality.          | Enables code scanning to identify vulnerabilities. |
| **Dependabot**      | Free                   | Automates dependency updates in repositories.                | Ensures libraries are up-to-date and secure. |
| **Slack**           | Free (with paid plans) | Instant messaging platform for team communication.           | Facilitates real-time collaboration and notifications. |
| **Other Tools**     | Optional               | Additional tools for security scanning or CI/CD enhancements. | Provides flexibility in adapting the pipeline. |

## 7. Addendum: Compliance and Governance
| Solution            | Compliance Assistance                         | Security Framework Controls                    |
|---------------------|-----------------------------------------------|------------------------------------------------|
| **GitHub**          | Provides audit trails and change logs.        | SOC 2, HIPAA                                  |
| **GitHub Actions**  | Automates compliance checks in CI/CD.         | SOC 2, HiTRUST                                |
| **Semgrep**         | Identifies vulnerabilities for security compliance. | SOC 2, HIPAA, HiTRUST                      |
| **Dependabot**      | Maintains updated, secure dependencies.       | SOC 2, HIPAA                                  |
| **Slack**           | Enables timely compliance notifications.      | SOC 2, HIPAA                                  |

## 8. Conclusion
Adhering to these SDLC and CI/CD standards will help ensure the successful delivery of high-quality software that meets user needs and complies with relevant regulations.
