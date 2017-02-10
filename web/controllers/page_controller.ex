defmodule AppPrototype.PageController do
  use AppPrototype.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "This is a demo info flash, hard-coded in PageController.")
    |> put_flash(:error, "This is a demo error flash, hard-coded in PageController.")
    |> render "index.html"
  end
end
