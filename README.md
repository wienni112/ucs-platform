# UCS Platform – SOGo Installer

Docker-based SOGo groupware setup for UCS environments using existing infrastructure for authentication and mail services.

This project provides a simple way to run **SOGo as a groupware frontend** while reusing:

* UCS for LDAP and user management
* UCS Mail Server for IMAP and SMTP
* optional Keycloak for SSO
* Nginx Proxy Manager as reverse proxy
* optional Proxmox Mail Gateway for spam filtering

---

# Architecture

The intended architecture separates responsibilities between infrastructure components.

```
Internet
   ↓
Proxmox Mail Gateway (optional)
   ↓
UCS Mail Server
   ↓
SOGo (Docker)
   ↓
Nginx Proxy Manager
```

### Component Responsibilities

| Component            | Responsibility                                     |
| -------------------- | -------------------------------------------------- |
| Proxmox Mail Gateway | Spam filtering and mail security                   |
| UCS Mail Server      | Mail delivery via IMAP / SMTP                      |
| UCS LDAP             | User and group management                          |
| SOGo                 | Webmail, calendar, contacts and groupware frontend |
| Nginx Proxy Manager  | Reverse proxy and TLS termination                  |
| Keycloak (optional)  | Single Sign-On                                     |

This repository intentionally **does not provide a full mail stack**, but focuses on running SOGo as the frontend for an existing UCS environment.

---

# Features

* Docker-based deployment
* Integration with UCS LDAP
* Uses UCS mail infrastructure
* Optional Keycloak SSO
* Compatible with Nginx Proxy Manager
* Optional Proxmox Mail Gateway support
* Simple installation scripts

---

# Requirements

The following components must already exist:

* UCS Domain Controller
* UCS Mail Server (IMAP + SMTP)
* Docker
* Docker Compose
* Reverse proxy (recommended: Nginx Proxy Manager)

Optional:

* Proxmox Mail Gateway
* Keycloak

---

# Installation

Clone the repository:

```bash
git clone https://github.com/wienni112/ucs-platform.git
cd ucs-platform/sogo
```

Create environment configuration:

```bash
cp .env.example .env
```

Edit the configuration:

```bash
nano .env
```

Install and start SOGo:

```bash
./scripts/install.sh
```

Verify installation:

```bash
./scripts/healthcheck.sh
```

---

# Environment Configuration

Example `.env` configuration:

```env
SOGO_DOMAIN=mail.example.com

LDAP_HOST=ucs.example.local
LDAP_BASE=dc=example,dc=local
LDAP_BIND_DN=uid=sogo,cn=users,dc=example,dc=local
LDAP_PASSWORD=secret

IMAP_HOST=ucs.example.local
SMTP_HOST=ucs.example.local
```

---

# Reverse Proxy Configuration

Example for **Nginx Proxy Manager**

Forward traffic to the SOGo container.

Recommended headers:

```
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto https;
proxy_set_header X-Forwarded-Port 443;
```

---

# Updating

Update the containers with:

```bash
./scripts/update.sh
```

---

# Backup

Create a backup with:

```bash
./scripts/backup.sh
```

Backups include:

* configuration
* environment variables
* database dump

---

# Health Check

Verify container and service status:

```bash
./scripts/healthcheck.sh
```

---

# Repository Structure

```
ucs-platform
├── docs
├── scripts
├── sogo
│   ├── docker-compose.yml
│   ├── config
│   └── README.md
├── LICENSE
└── README.md
```

---

# Scope

This project focuses on running **SOGo as webmail and groupware frontend**.

It does **not replace UCS mail services**.

Mail delivery, authentication and spam filtering remain handled by the UCS infrastructure.

---

# Future Features

Planned improvements include:

* Keycloak SSO integration
* automated Docker image builds
* UCS App Center integration
* improved installation scripts
* deployment automation

---

# License

This project is licensed under the **MIT License**.

---

# Contributing

Contributions are welcome.

If you find a bug or want to propose a feature, please open an issue.

---

# Author

David Wieninger
https://github.com/wienni112
