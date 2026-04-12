# Nginx Proxy Manager for SOGo

## Public host

Example:

`mail.feuerwehren-birkenau.de`

## Upstream

Forward to:

- scheme: `http`
- host: APP01 / Docker host
- port: `20000`

## Recommended proxy headers

```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto https;
proxy_set_header X-Forwarded-Port 443;
