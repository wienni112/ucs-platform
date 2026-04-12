# Keycloak SAML integration for SOGo

## Goal

Use Keycloak as SAML Identity Provider for SOGo web login.

## Flow

User -> SOGo -> Keycloak -> UCS directory -> SOGo

## Recommended login attribute

Use `mail` as SAML login attribute if your mail addresses are unique.

## Steps

1. Open the Keycloak admin console in realm `ucs`
2. Create a new SAML client for SOGo
3. Import the SOGo service provider metadata from:

   `/SOGo/saml2-metadata`

4. Configure the client mappers so that Keycloak sends the chosen login attribute
5. Export IdP metadata from Keycloak
6. Save the metadata as:

   `sogo/saml/idp-metadata.xml`

7. Place the SOGo SP certificate and key into:

   - `sogo/certs/sogo.crt`
   - `sogo/certs/sogo.key`

8. Set in `.env`:

   - `SOGO_AUTH_TYPE=saml2`
   - `SAML_LOGIN_ATTRIBUTE=mail`

## Important

The value of `SAML_LOGIN_ATTRIBUTE` must match the actual attribute sent by Keycloak.
