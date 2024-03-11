defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def handle_params(params, _, socket) do
    {:noreply, assign_repositories(socket, params)}
  end

  def handle_event("load_more", _, socket) do
    language = socket.assigns.language
    page = socket.assigns.page
    repositories = Repositories.list(language, page)

    socket =
      socket
      |> update(:page, &(&1 + 1))
      |> update_socket(repositories)

    {:noreply, socket}
  end

  defp assign_repositories(socket, params) do
    language = params["language"] || "elixir"
    page = 1
    socket = assign(socket, language: language, page: page)
    repositories = Repositories.list(language, page)
    update_socket(socket, repositories)
  end

  defp update_socket(socket, repositories) do
    case repositories do
      {:error, message} ->
        socket
        |> put_flash(:error, message)
        |> stream(:repositories, [], at: 0)

      repositories ->
        stream(socket, :repositories, repositories, at: 0)
    end
  end
end
