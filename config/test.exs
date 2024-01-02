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
  database: "phoenix_e2e_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10


# Configure the database for GitHub Actions
if System.get_env("GITHUB_ACTIONS") do
  config :phoenix_e2e, PhoenixE2e.Repo,
    username: "postgres",
    password: "postgres"
end

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_e2e, PhoenixE2eWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "6tBzNe4/LeskuZ3+ASnHVTkirx+dGqSdfySEmHrcWUXDuDSzDhtdgBwafWTA6eNE",
  server: false

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

config :wallaby, otp_app: :phoenix_e2e

