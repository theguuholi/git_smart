defmodule GitSmart.Repositories do
  alias GitSmart.Repositories.GithubApi

  def list(language, page) do
    GithubApi.search_repository_by_language(language, page)
  end
end
