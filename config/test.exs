import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_e2e, PhoenixE2e.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_e2e, PhoenixE2eWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "6tBzNe4/LeskuZ3+ASnHVTkirx+dGqSdfySEmHrcWUXDuDSzDhtdgBwafWTA6eNE",
  server: true


# In test we don't send emails.
config :phoenix_e2e, PhoenixE2e.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Selenium
config :wallaby, driver: Wallaby.Selenium
config :wallaby, screenshot_on_failure: true
config :wallaby, otp_app: :phoenix_e2e

