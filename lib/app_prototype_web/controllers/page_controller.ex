defmodule AppPrototypeWeb.PageController do
  use AppPrototype.Web, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
