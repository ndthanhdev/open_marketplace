import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :backend_web, BackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Jh8YYM59xPHt+nzibUwMYbT7WIG+wZ72uxMf5cBTPlXLqQ4Ran7DS6b0ka7DXAkB",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
