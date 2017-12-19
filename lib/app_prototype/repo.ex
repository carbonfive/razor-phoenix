defmodule AppPrototype.Repo do
  use Ecto.Repo, otp_app: :app_prototype

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    pool_size = String.to_integer(System.get_env("POOL_SIZE") || "10")
    database_url = System.get_env("DATABASE_URL") || raise("Expected DATABASE_URL environment variable to be set.")

    opts = opts
    |> Keyword.put(:url, database_url)
    |> Keyword.put(:pool_size, pool_size)

    {:ok, opts}
  end
end
