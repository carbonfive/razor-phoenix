defmodule AppPrototype.UserListTest do
  use AppPrototype.AcceptanceCase, async: true

  test "flash notices", %{session: session} do
    info_flash_text =
      session
      |> visit("/")
      |> find(".alert-info")
      |> text
    assert String.contains?(info_flash_text, "demo")

    error_flash_text =
      session
      |> visit("/")
      |> find(".alert-danger")
      |> text
    assert String.contains?(error_flash_text, "demo")
  end

  test "javascript is working", %{session: session} do
    js_demo_text =
      session
      |> visit("/")
      |> find("#js-demo")
      |> text
    assert String.contains?(js_demo_text, "Brunch with custom js is working")
  end
end
