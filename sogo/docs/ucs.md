# UCS integration notes

## UCS remains the source of truth

- users
- groups
- mail addresses
- passwords

## Suggested LDAP approach

- bind with a dedicated technical account if possible
- search users under `cn=users,...`
- use `mailPrimaryAddress` for login if desired

## Mail backend

Reuse the UCS mail stack for:

- IMAP
- SMTP
- sieve / vacation if exposed
