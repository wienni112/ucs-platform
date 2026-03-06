---
name: Bug report
about: Report a problem with the UCS Platform setup
title: "[BUG] "
labels: bug
assignees: ''
---

## 🐞 Problem description

Describe what is not working.

Example:
- Login fails
- SOGo web interface not reachable
- LDAP authentication not working

---

## 🔧 Environment

Please complete the following information.

- UCS version:
- SOGo version:
- Docker version:
- Installation type: (script / manual)
- Reverse proxy: (Nginx Proxy Manager / Traefik / none)
- Mail backend: (UCS Mail / external IMAP)

---

## 🌐 Network / Proxy Setup

- Public URL:
- Internal SOGo port:
- Reverse proxy configuration:

---

## 📋 Steps to reproduce

Steps to reproduce the behavior:

1. Go to ...
2. Click on ...
3. Login with ...
4. See error

---

## ✅ Expected behavior

Describe what should happen.

Example:
User should be able to login via LDAP.

---

## ❌ Actual behavior

Describe what happens instead.

Example:
Login fails with "authentication error".

---

## 📄 Logs

Please include relevant logs.

### Docker

```bash
docker ps
docker logs sogo
```

### SOGo

```bash
docker exec -it sogo tail -n 100 /var/log/sogo/sogo.log
```

### UCS / LDAP

```bash
journalctl -u slapd
```

---

## 📷 Screenshots (optional)

If applicable, add screenshots.

---

## ℹ️ Additional context

Add any other context about the problem here.
