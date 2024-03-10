defmodule GitSmartWeb.PageLive.IndexTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "render/1 render the default important elements" do
    test "render the index template", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      ["Elixir", "JavaScript", "Java", "Rust", "Go"]
      |> Enum.each(fn language ->
        assert has_element?(lv, "button", language)
      end)
    end
  end
end
