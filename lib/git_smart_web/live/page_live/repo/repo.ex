defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(is_added: false)

    {:ok, socket}
  end

  def handle_event("add_repo", _, socket) do
    {:noreply, assign(socket, is_added: true)}
  end
end
