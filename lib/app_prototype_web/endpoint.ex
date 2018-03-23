defmodule AppPrototypeWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :app_prototype

  socket("/socket", AppPrototypeWeb.UserSocket)

  # Enable concurrent testing
  if Application.get_env(:app_prototype, :sql_sandbox) do
    plug(Phoenix.Ecto.SQL.Sandbox)
  end

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug(
    Plug.Static,
    at: "/",
    from: :app_prototype,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
  )

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.LiveReloader)
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug(
    Plug.Session,
    store: :cookie,
    key: "_app_prototype_key",
    signing_salt: "D8tkl6+p"
  )

  plug(AppPrototypeWeb.Router)

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"

      host =
        System.get_env("HOSTNAME") || raise "expected the HOSTNAME environment variable to be set"

      secret_key_base =
        System.get_env("SECRET_KEY_BASE") ||
          raise "expected SECRET_KEY_BASE environment variable to be set"

      config =
        config
        |> Keyword.put(:http, [:inet6, port: port])
        |> Keyword.put(:url, scheme: "https", host: host, port: 443)
        |> Keyword.put(:secret_key_base, secret_key_base)

      {:ok, config}
    else
      {:ok, config}
    end
  end
end
