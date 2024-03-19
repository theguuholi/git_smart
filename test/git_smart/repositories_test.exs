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

  describe "list_all_saved_git_ids/0" do
    test "lists all saved git ids" do
      Repositories.create(@payload)
      git_ids = Repositories.list_all_saved_git_ids()
      assert @payload.git_id == Enum.at(git_ids, 0)
      assert 1 == Enum.count(git_ids)
    end
  end

  describe "get_repository_by_git_id/1" do
    test "gets a repository by git id" do
      Repositories.create(@payload)
      repository = Repositories.get_repository_by_git_id(@payload.git_id)
      assert repository.git_id == 279_895_213
      assert repository.language == "Elixir"
    end
  end

  describe "all/0" do
    test "lists all repositories" do
      Repositories.create(@payload)
      repositories = Repositories.all()
      assert @payload.git_id == Enum.at(repositories, 0).git_id
      assert 1 == Enum.count(repositories)
    end
  end
end
