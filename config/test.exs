use Mix.Config

config :shop, Shop.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  database: "shop_es",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool_size: 10

config :shop, Shop.Repo,
  database: "shop_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, Api.Endpoint,
  http: [port: 4002],
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :open_marketplace, OpenMarketplace.Repo,
  username: "postgres",
  password: "postgres",
  database: "open_marketplace_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :open_marketplace_web, OpenMarketplaceWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
