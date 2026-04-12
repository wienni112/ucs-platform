# UCS LDAP integration for SOGo

## Goal

Use UCS LDAP as user and address book source for SOGo.

## Recommended approach

- Use a dedicated read-only LDAP service account
- Restrict access to required user attributes only
- Prefer SSO for web login later
- Keep LDAP for lookup and address book

## Example values

- LDAP host: `dc01.ad.feuerwehren-birkenau.de`
- LDAP port: `7389`
- Base DN: `dc=ad,dc=feuerwehren-birkenau,dc=de`

## Suggested LDAP attributes

- Login / UID field: `mailPrimaryAddress`
- Object ID field: `uid`
- Display name field: `cn`

## Example LDAP bind DN

`uid=sogo-ldap,cn=users,dc=ad,dc=feuerwehren-birkenau,dc=de`

## Notes

If SOGo is used with direct LDAP login, `canAuthenticate = YES` can remain enabled.

If SOGo is used with Keycloak SAML, LDAP should mainly serve as directory and address book source.
