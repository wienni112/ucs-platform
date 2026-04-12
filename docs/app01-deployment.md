# APP01 deployment notes

## Target

Run SOGo on APP01 and integrate it with:

- UCS LDAP
- UCS Mail
- Keycloak SSO
- Nginx Proxy Manager

## Suggested hostname

`mail.feuerwehren-birkenau.de`

## Deployment order

1. Prepare `.env`
2. Render `sogo.conf`
3. Start MariaDB and memcached
4. Start SOGo
5. Configure reverse proxy
6. Test LDAP and mail access
7. Add Keycloak SAML
8. Switch `SOGO_AUTH_TYPE` from `ldap` to `saml2`

## Recommendation

Start with LDAP login first for baseline verification.
After that, enable Keycloak SAML.
