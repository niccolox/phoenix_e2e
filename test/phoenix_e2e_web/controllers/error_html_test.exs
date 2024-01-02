defmodule PhoenixE2eWeb.ErrorHTMLTest do
  use PhoenixE2eWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(PhoenixE2eWeb.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(PhoenixE2eWeb.ErrorHTML, "500", "html", []) == "Internal Server Error"
  end

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
