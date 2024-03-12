defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def mount(_, _, socket) do
    repositories = Repositories.list()
    socket = assign(socket, :repositories, repositories)
    {:ok, socket}
  end
end
