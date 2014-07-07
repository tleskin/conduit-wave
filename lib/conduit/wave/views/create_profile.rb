<%= MultiJson.dump({
  auth_token:    token,
  profile: {
    name:        name,
    provider:    provider,
    credentials: credentials
  }
}) %>
