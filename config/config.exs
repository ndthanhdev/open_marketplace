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



config :open_marketplace_web,
  generators: [context_app: :open_marketplace]

# Configures the endpoint
config :open_marketplace_web, OpenMarketplaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ku3UXLAeaYF180HffqqbIfdMmXwNlbJMGqA/IcG89ikk7LGdXIxpaOnmMDQdfwu4",
  render_errors: [view: OpenMarketplaceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: OpenMarketplace.PubSub,
  live_view: [signing_salt: "7vdE6cwW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
