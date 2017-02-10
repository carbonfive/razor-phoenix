ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(AppPrototype.Repo, :manual)

# Wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, AppPrototype.Endpoint.url)
