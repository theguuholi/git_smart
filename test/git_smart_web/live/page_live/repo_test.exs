defmodule GitSmartWeb.PageLive.RepoTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "render/1 render the default important elements" do
    test "render the repo live component", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      main_element = "li#repo-elixir"
      assert has_element?(lv, main_element)
      assert has_element?(lv, "#{main_element}>div>div>h3", "Elixir Language")
      assert has_element?(lv, "#{main_element}>div>div>span", "1,000")
      assert has_element?(lv, "#{main_element}>div>div>p", "pumpkin123")
      assert has_element?(lv, "#{main_element}>div>div>button")
    end
  end
end
