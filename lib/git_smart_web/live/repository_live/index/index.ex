defmodule GitSmartWeb.RepositoryLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmart.Repositories
  import GitSmartWeb.RepositoryComponents

  def mount(_, _, socket) do
    repositories = Repositories.all()
    {:ok, assign(socket, repositories: repositories)}
  end
end
