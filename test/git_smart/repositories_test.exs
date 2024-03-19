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
    test "given a payload, then create a repository" do
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

  describe "all/0" do
    test "tiven a list of repositories, then return all repositories" do
      Repositories.create(@payload)
      assert Repositories.all() |> length() == 1
    end
  end

  describe "list_all_saved_git_ids/0" do
    test "list all saved git ids" do
      Repositories.create(@payload)

      git_ids = Repositories.list_all_saved_git_ids()
      assert 1 == Enum.count(git_ids)
    end
  end
end
