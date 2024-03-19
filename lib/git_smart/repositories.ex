defmodule GitSmart.Repositories do
  alias __MODULE__.GithubApi
  alias __MODULE__.Repository
  alias GitSmart.Repo

  def list(language, page \\ 1) do
    GithubApi.search_repository_by_language(language, page)
  end

  def create(attrs) do
    attrs
    |> Repository.changeset()
    |> Repo.insert!()
  end

  def all, do: Repo.all(Repository)
end
