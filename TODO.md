- SET GITHUB_TOKEN
- SET GITHUB_USER
- aws configure sso

curl -i -u $GITHUB_USER:$GITHUB_TOKEN https://api.github.com/users/octocat