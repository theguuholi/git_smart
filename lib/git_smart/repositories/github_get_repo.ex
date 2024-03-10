defmodule GitSmart.Repositories.GithubApi do
  @client GitSmart.Finch
  def search_repository_by_language() do
    url =
      "https://api.github.com/search/repositories?q=language:elixir&sort=stars&order=desc&page=1&per_page=5"

    :get
    |> Finch.build(url)
    |> Finch.request(@client)
    |> handle_response()
  end

  defp handle_response({:ok, %{status: 404}}), do: {:error, "Not Found"}

  defp handle_response({:ok, response}) do
    {:ok, Jason.decode!(response.body)}
  end
end
