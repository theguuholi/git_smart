defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component

  def update(assigns, socket) do
    IO.inspect(assigns)

    socket =
      socket
      |> assign(assigns)
      |> assign(is_added: false)

    {:ok, socket}
  end

  def handle_event("add_repo", _params, socket) do
    {:noreply, update(socket, :is_added, &(!&1))}
  end
end
