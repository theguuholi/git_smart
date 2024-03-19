defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component
  alias GitSmart.Repositories
  import GitSmartWeb.RepositoryComponents

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(is_added: false)

    {:ok, socket}
  end

  def handle_event("add_repo", _params, socket) do
    repository = socket.assigns.repository
    Repositories.create(repository)
    {:noreply, update(socket, :is_added, &(!&1))}
  end
end
