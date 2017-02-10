use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :app_prototype, AppPrototype.Endpoint,
  secret_key_base: "5BT7FRK4yswIGZRbS6t+oya9D/lq7TXjIsU3UskvUDP5WEHpoaQn1n/Je7ozIOHH"

# Configure your database
config :app_prototype, AppPrototype.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "app_prototype_prod",
  pool_size: 20
