defmodule GitSmart.RepositoriesTest do
  use GitSmart.DataCase
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

  describe "create/1" do
    test "creates a new repository" do
      repository = Repositories.create(@payload)
      assert repository.avatar_url == "https://avatars.githubusercontent.com/u/68310464?v=4"
      assert repository.description == "Open-source live customer chat"
      assert repository.forks == 480
      assert repository.git_id == 279_895_213
      assert repository.language == "Elixir"
      assert repository.full_name == "papercups-io/papercups"
      assert repository.open_issues == 167
      assert repository.html_url == "https://api.github.com/repos/papercups-io/papercups"
    end
  end
end