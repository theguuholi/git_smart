defmodule GitSmartWeb.RepositoryLive.Show do
  use GitSmartWeb, :live_view
  alias GitSmart.Repositories

  def mount(%{"git_id" => git_id}, _, socket) do
    repository = Repositories.get_repository_by_git_id(git_id)
    IO.inspect(repository)
    {:ok, assign(socket, repository: repository)}
  end
end
