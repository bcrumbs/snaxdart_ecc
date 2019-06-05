#!/usr/bin/env bash
mkdir -p .pub-cache

cat <<EOF > ~/.pub-cache/credentials.json
{
   "accessToken":"$accessToken",
   "refreshToken":"$refreshToken",
   "tokenEndpoint":"$tokenEndpoint",
   "scopes":["openid","https://www.googleapis.com/auth/userinfo.email"],
   "expiration":$expiration
}
EOF

echo "Let's publish this!"
pub publish -f
