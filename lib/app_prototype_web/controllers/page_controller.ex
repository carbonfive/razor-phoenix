defmodule AppPrototypeWeb.PageController do
  use AppPrototypeWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
