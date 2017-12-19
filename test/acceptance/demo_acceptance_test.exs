defmodule AppPrototype.UserListTest do
  use AppPrototype.AcceptanceCase, async: true

  test "javascript is working", %{session: session} do
    session
    |> visit("/")
    |> find(Query.css("#js-demo"))
    |> assert_text("Brunch with custom js is working")
  end
end
