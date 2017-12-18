ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(AppPrototype.Repo, :manual)

# Auto-skip tests with @tag :skip
ExUnit.configure(exclude: [skip: true])

# Wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, AppPrototypeWeb.Endpoint.url)

# ExMachina
{:ok, _} = Application.ensure_all_started(:ex_machina)
