# Fyoog

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## TODO
Issues for the following:
  * Add title, description to migration and schema for videos
  * Add file body as virtual field on video schema
  * Make list of videos show thumbnail, title, abbreviated description, that's it!
  * Add env vars for S3 credentials
  * Make relation between users and videos one-to-many
  * Get video upload to S3 working <-- HIGHER PRIORITY
  * Add profile pic and description to users
  * Add Vault/Cloak to encrypt sensitive info
