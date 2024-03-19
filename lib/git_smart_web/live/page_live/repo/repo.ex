defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component
  alias GitSmart.Repositories
  import GitSmartWeb.RepositoryComponents

  def update(%{repository: repository, git_ids: git_ids} = assigns, socket) do
    git_id = repository.git_id

    socket =
      socket
      |> assign(assigns)
      |> assign(is_repository_saved: Enum.member?(git_ids, git_id))
      |> assign(is_added: false)

    {:ok, socket}
  end

  def handle_event("add_repo", _params, socket) do
    repository = socket.assigns.repository

    Repositories.create(repository)

    {:noreply,
     socket
     |> update(:is_added, &(!&1))
     |> update(:is_repository_saved, &(!&1))}
  end

  # def handle_event("go_to_repo", %{"git_id" => git_id}, socket) do
  #   # explain why we have backend event and fe event using navigation and be aware to use buttons
  #   {:noreply, push_navigate(socket, to: ~p"/repositories/#{git_id}")}
  # end
end
