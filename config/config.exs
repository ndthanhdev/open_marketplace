# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :shop, event_stores: [Shop.EventStore]

config :shop, ecto_repos: [Shop.Repo]

config :api,
  ecto_repos: [Api.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :api, Api.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zXsJttsWIjsAM+tZoKSs7fnTDl6HUUggNf+5vn7wbuP9iE3PYsXeqHGKdRpzqJna",
  render_errors: [view: Api.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "TQHNlZsc"]

# Configure Mix tasks and generators
config :open_marketplace,
  ecto_repos: [OpenMarketplace.Repo]

config :open_marketplace_web,
  ecto_repos: [OpenMarketplace.Repo],
  generators: [context_app: :open_marketplace]

# Configures the endpoint
config :open_marketplace_web, OpenMarketplaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AMzKLRnroLWV8SBV+fCGiuQWPjuhnu2WGEtYOD1AmmubciFpBKK6Vr7MR1CqdmM+",
  render_errors: [view: OpenMarketplaceWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OpenMarketplace.PubSub,
  live_view: [signing_salt: "kNz4EoRv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
