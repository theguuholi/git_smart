defmodule GitSmartWeb.RepositoryLive.IndexTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest
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

  describe "render/1 render the default important elements" do
    test "render the index repositories", %{conn: conn} do
      repository = Repositories.create(@payload)

      {:ok, lv, _html} = live(conn, ~p"/repositories")
      assert has_element?(lv, "##{repository.id}")
    end
  end
end
