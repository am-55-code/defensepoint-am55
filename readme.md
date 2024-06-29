# Security Recommendations
## 1 - App Service
a. Use HTTPS, enable only security connections to the app.

b. To avoid secrets in the code utilizing managed identites between the resources would be nice.

c. In the connection strings to the Database, utilization of a Key Vault.

d. Use SSL/TLS certificates with the custom domain attached to the workload.

## 2 - CDN
a. Use WAF in the CDN profile/endpoint, to block common attacks.

b. Use geo-filtering to restrict access to undesired countries.

c. Enabled DDoS protection built into the resource.

## 3 - Cloud Provider
a. Use accounts with MFA enabled and RBAC with just enough roles to work with the application.
b. Enable geofencing and CAP policies, if possible use Privileged Identity Management (PIM).
