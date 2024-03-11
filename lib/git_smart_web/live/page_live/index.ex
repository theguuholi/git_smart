defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def handle_params(params, _, socket) do
    socket = assign_repositories(socket, params)
    {:noreply, socket}
  end

  def handle_event("load_more", _, socket) do
    {:noreply, socket}
  end

  defp assign_repositories(socket, params) do
    language = params["language"] || "elixir"
    page = params["page"] || "1"
    repositories = Repositories.list(language, page)

    case repositories do
      {:error, message} ->
        socket
        |> put_flash(:error, message)

      repositories ->
        stream(socket, :repositories, repositories, at: 0)
    end
  end
end
