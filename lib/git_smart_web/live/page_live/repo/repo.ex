defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component
  alias GitSmart.Repositories
  import GitSmartWeb.RepositoryComponents

  def update(%{repository: repository, git_ids: git_ids} = assigns, socket) do
    git_id = repository.git_id

    socket =
      socket
      |> assign(assigns)
      |> assign(is_added: false)
      |> assign(is_repository_saved: Enum.member?(git_ids, git_id))

    {:ok, socket}
  end

  def handle_event("add_repo", _params, socket) do
    repository = socket.assigns.repository
    Repositories.create(repository)
    {:noreply, update(socket, :is_added, &(!&1))}
  end

  def handle_event("go_to_repo", %{"git_id" => git_id}, socket) do
    socket = push_navigate(socket, to: ~p"/repositories/#{git_id}")
    {:noreply, socket}
  end
end
