# ucs-sogo-installer

Starter repository for running **SOGo** in Docker while reusing:

- **UCS** for LDAP / user management
- **UCS mail server** for IMAP / SMTP
- **Keycloak** for web SSO later
- **Nginx Proxy Manager** as reverse proxy
- optionally **Proxmox Mail Gateway** in front of UCS mail

## Scope

This repository is intentionally focused on **SOGo as webmail and groupware frontend**.
It does **not** build a full mail stack in Docker, because the target architecture is:

```text
Internet -> Proxmox Mail Gateway -> UCS Mail -> SOGo
```

## Planned architecture

```text
UCS
├── LDAP / AD
├── Mail server (IMAP / SMTP)
└── Keycloak

Docker host
└── SOGo

Nginx Proxy Manager
└── mail.example.org -> SOGo
```

## Quick start

1. Copy `.env.example` to `.env`
2. Adjust LDAP, IMAP, SMTP and database values
3. Review `config/sogo/sogo.conf`
4. Run:

```bash
./scripts/install.sh
```

## Notes

- `config/sogo/sogo.conf` is a template and still needs real values or rendering.
- For production, pin image tags instead of `latest`.
- Add a dedicated database service or connect to an existing PostgreSQL / MariaDB host.
- For Keycloak SSO, add a dedicated documentation / import script later.

## Reverse proxy example

Public host example:

```text
mail.ucs-project.de
```

NPM should proxy to the SOGo host on `${SOGO_HTTP_PORT}`.

Recommended upstream headers:

```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto https;
proxy_set_header X-Forwarded-Port 443;
```

## License

Pick a license before publishing. For this kind of infra repo, `MIT` or `Apache-2.0` are usually good choices.
