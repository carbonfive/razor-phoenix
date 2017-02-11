use Mix.Config

# We run a server during test for Wallaby integration testing.
config :app_prototype, AppPrototype.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :app_prototype, AppPrototype.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "app_prototype_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :app_prototype, :sql_sandbox, true
