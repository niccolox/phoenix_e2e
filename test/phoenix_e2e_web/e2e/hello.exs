defmodule PhoenixE2e.Wallaby.Integration.Browser.HomepageHasTextTest do
  use Wallaby.Integration.SessionCase, async: true

  setup %{session: session} do
    page = visit(session, "/")
    {:ok, %{page: page}}
  end

  @h1 Query.css("h1")

  describe "has_text/3" do
    test "checks if the query has the specified text", %{page: page} do
      assert page
             |> has_text?(@h1, "Phoenix Framework")
    end
  end

end