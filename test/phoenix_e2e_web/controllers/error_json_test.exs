defmodule PhoenixE2eWeb.ErrorJSONTest do
  use PhoenixE2eWeb.ConnCase, async: true

  test "renders 404" do
    assert PhoenixE2eWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PhoenixE2eWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
