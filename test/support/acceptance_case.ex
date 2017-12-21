defmodule AppPrototype.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias AppPrototype.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import AppPrototypeWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(AppPrototype.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(AppPrototype.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(AppPrototype.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
