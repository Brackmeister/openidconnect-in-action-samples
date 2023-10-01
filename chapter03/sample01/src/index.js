import React from 'react';
import ReactDOM from 'react-dom';
import App from "./components/App.js";

import {Auth0Provider} from '@facilelogin/oidc-react';

ReactDOM.render(
    <Auth0Provider
        domain="localhost:8443"
        tokenEp="realms/my-realm/protocol/openid-connect/token"
        authzEp="realms/my-realm/protocol/openid-connect/auth"
        clientId="frontend"
        issuer="https://localhost:8443/realms/my-realm"
        redirectUri={window.location.origin}>
      <App />
    </Auth0Provider>,
    document.getElementById('book-club-app')
);
