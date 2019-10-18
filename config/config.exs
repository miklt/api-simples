# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_api,
  ecto_repos: [SimpleApi.Repo],
  generators: [binary_id: true]
# Suporta microsegundo no nível do banco de dados.  
config :simple_api, SimpleApi.Repo, migration_timestamps: [type: :utc_datetime_usec]

# Configures the endpoint
config :simple_api, SimpleApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2iIntfK2Eg4NwP/AEqVoWjXPYmFcxqckZDqC1bcl74wDMTdLhq2spf4L7Lf07UCk",
  render_errors: [view: SimpleApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SimpleApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
