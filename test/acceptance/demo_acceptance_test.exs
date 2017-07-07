defmodule AppPrototype.UserListTest do
  use AppPrototype.AcceptanceCase, async: true

  test "javascript is working", %{session: session} do
    js_demo_text =
      session
      |> visit("/")
      |> find("#js-demo")
      |> text
    assert String.contains?(js_demo_text, "Brunch with custom js is working")
  end
end
