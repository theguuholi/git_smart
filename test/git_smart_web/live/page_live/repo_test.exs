defmodule GitSmartWeb.PageLive.RepoTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "render/1 Repo" do
    test "render the repo live_component", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")
      assert has_element?(lv, "#elixir")
      assert has_element?(lv, "#elixir>div>div>h3", "Elixir Language")
      assert has_element?(lv, "#elixir>div>div>span", "1,000")
      assert has_element?(lv, "#elixir>div>div>p", "pumpkin")
      assert has_element?(lv, "#elixir>div>div>button")
    end
  end
end
