# Reverse proxy notes

Suggested public URL:

```text
https://mail.example.org/SOGo
```

Example NPM headers:

```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto https;
proxy_set_header X-Forwarded-Port 443;
```

Add upload / timeout settings as needed.
