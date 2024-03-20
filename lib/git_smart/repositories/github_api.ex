defmodule GitSmart.Repositories.GithubApi do
  @client GitSmart.Finch

  def search_repository_by_language(language, page \\ 1) do
    uri =
      "https://api.github.com/search/repositories?q=language:#{language}&sort=stars&order=desc&page=#{page}&per_page=10"

    :get
    |> Finch.build(uri)
    |> Finch.request(@client)
    |> handle_response()
  end

  defp handle_response({:ok, %{status: 403}}), do: {:error, "Rate limit exceeded"}

  defp handle_response({:ok, response}) do
    response.body
    |> Jason.decode!()
    |> then(fn %{"items" => repositories} ->
      Enum.map(repositories, &map_repository/1)
    end)
  end

  defp map_repository(repository) do
    %{
      id: repository["id"],
      git_id: repository["id"],
      avatar_url: repository["owner"]["avatar_url"],
      full_name: repository["full_name"],
      watchers_count: repository["watchers_count"],
      forks: repository["forks"],
      description: repository["description"],
      name: repository["watchers_count"],
      open_issues: repository["open_issues"],
      html_url: repository["html_url"],
      language: repository["language"]
    }
  end
end
