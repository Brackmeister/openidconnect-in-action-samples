resource "keycloak_realm" "myrealm" {
  realm   = "my-realm"
  enabled = true
}

resource "keycloak_openid_client" "frontend" {
  realm_id  = keycloak_realm.myrealm.id
  client_id = "frontend"

  enabled               = true
  access_type           = "PUBLIC"
  standard_flow_enabled = true
  valid_redirect_uris   = [
    "https://oauth.pstmn.io/v1/callback",
    "https://localhost:3000"
  ]
  web_origins = ["+"]
  login_theme = "keycloak"
}

resource "keycloak_user" "user" {
  realm_id = keycloak_realm.myrealm.id
  username = "user"
  enabled  = true

  email      = "user@example.com"
  first_name = "John"
  last_name  = "Doe"

  initial_password {
    value     = "user"
    temporary = false
  }
}
