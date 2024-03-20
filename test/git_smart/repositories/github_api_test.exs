defmodule GitSmart.Repositories.GithubApiTest do
  use GitSmart.DataCase
  alias GitSmart.Repositories.GithubApi
  import Mock

  describe "search_repository_by_language/2" do
    test "thow error message" do
      with_mocks([
        {Finch, [], build: fn _, _ -> nil end},
        {Finch, [], request: fn _, _ -> {:ok, %{status: 403}} end}
      ]) do
        assert {:error, "Rate limit exceeded"} ==
                 GithubApi.search_repository_by_language("Elixir")
      end
    end
  end
end
