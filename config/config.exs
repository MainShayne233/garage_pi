# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :garage_pi,
  ecto_repos: [GaragePi.Repo]

# Configures the endpoint
config :garage_pi, GaragePi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tnBqE3fp4gd9HF0E6dWVx1aryVt5+0RN3IZeSGKImUZi/UnM4nj2wOcExLpNEeBK",
  render_errors: [view: GaragePi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GaragePi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
