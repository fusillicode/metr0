# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :metr0,
  ecto_repos: [Metr0.Repo]

# Configures the endpoint
config :metr0, Metr0.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KGRGqoy7o4SF00RKjbhYXuShJWYjwf7OAckUPidfYdg1N5QkZtE2AGVfVjFNh2ec",
  render_errors: [view: Metr0.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Metr0.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Guardian
config :guardian, Guardian,
  issuer: "Metr0.#{Mix.env}",
  ttl: { 30, :days },
  verify_issuer: true,
  secret_key: to_string(Mix.env),
  serializer: Metr0.GuardianSerializer,
  hooks: GuardianDb,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

# Configure GuardianDb
config :guardian_db, GuardianDb,
  repo: Metr0.Repo,
  sweep_interval: 60

# Configure Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
