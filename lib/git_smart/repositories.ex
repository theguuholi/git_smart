defmodule GitSmart.Repositories do
  alias __MODULE__.GithubApi

  def list(language, page \\ 1) do
    GithubApi.search_repository_by_language(language, page)
  end
end
