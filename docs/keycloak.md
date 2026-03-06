# Keycloak notes

Target: use Keycloak only for **web SSO** into SOGo.

Mail protocols (IMAP / SMTP) still authenticate against the mail backend / LDAP.

Planned follow-up:

- OIDC or SAML client definition
- reverse proxy callback URLs
- logout handling
