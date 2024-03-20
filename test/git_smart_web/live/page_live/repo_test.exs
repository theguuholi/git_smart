defmodule GitSmartWeb.PageLive.RepoTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest
  import Mock
  alias GitSmart.Repositories

  @payload %{
    avatar_url: "https://avatars.githubusercontent.com/u/68310464?v=4",
    description: "Open-source live customer chat",
    forks: 480,
    full_name: "papercups-io/papercups",
    git_id: 279_895_213,
    id: 279_895_213,
    language: "Elixir",
    name: 5580,
    open_issues: 167,
    html_url: "https://api.github.com/repos/papercups-io/papercups",
    watchers_count: 5580
  }

  setup_with_mocks([
    {Repositories, [], list: fn _, _ -> [@payload] end},
    {Repositories, [], list_all_saved_git_ids: fn -> [] end},
    {Repositories, [], create: fn _ -> nil end}
  ]) do
    {:ok, %{}}
  end

  describe "render/1 Repo" do
    test "render the repo live_component", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")
      id = "#repositories-#{@payload.git_id}"
      assert has_element?(lv, "#{id}")
      assert has_element?(lv, "#{id}>div>div>div>h3", @payload.full_name)
      assert has_element?(lv, "#{id}>div>div>div>p", @payload.description)
      assert has_element?(lv, "#{id}>div>div>div>button")
    end
  end

  describe "handle_event/3 - add_repo" do
    test "add repo", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      refute has_element?(lv, "#repositories-#{@payload.git_id}>div>div", "Repo added!")

      lv |> element("button[phx-click=add_repo]") |> render_click()

      assert has_element?(lv, "#repositories-#{@payload.git_id}>div>div", "Repo added!")
    end
  end
end
