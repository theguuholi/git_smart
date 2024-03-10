defmodule GitSmart.Repositories do
  def list() do
    for _ <- 1..10, do: mock()
  end

  defp mock() do
    %{
      git_id: :rand.uniform(1000),
      avatar_url: "https://avatars.githubusercontent.com/u/1481354?s=200&v4",
      full_name: "Elixir Language",
      watchers_count: 1000,
      forks: 500,
      description: "pumpkin123",
      name: "elixir",
      open_issues: 10,
      language: "Elixir"
    }
  end
end
