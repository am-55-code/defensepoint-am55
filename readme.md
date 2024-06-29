Security Recomendations
1 - App Service
a. Use HTTPS, enable only security connections to the app
b. To avoid secrets in the code utilizing managed identites would be nice.
c. In the connection strings to the Database, utilization of a Key Vault
d. Use SSL/TLS certificates with the custom domain attached to the workload

2 - CDN
a. Use WAF in the CDN profile/endpoint, to block common attacks
b. Use geofiltering to restrict access to undesired country
c. Enabled DDOs protection built in the resource.