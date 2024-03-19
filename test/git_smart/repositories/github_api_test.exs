defmodule GitSmart.Repositories.GithubApiTest do
  use GitSmart.DataCase
  alias GitSmart.Repositories.GithubApi
  import Mock

  describe "search_repository_by_language/3" do
    test "when make a research throw an error" do
      error = {:ok, %{status: 403}}

      with_mocks [
        {Finch, [], build: fn _, _ -> nil end},
        {Finch, [], request: fn _, _ -> error end}
      ] do
        response = GithubApi.search_repository_by_language("elixir", 1)
        assert {:error, "Rate limit exceeded"} == response
      end
    end
  end
end
