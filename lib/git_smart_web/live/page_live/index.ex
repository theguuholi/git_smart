defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def mount(_, _, socket) do
    {:ok, socket}
  end

  def handle_params(params, _, socket) do
    language = params["language"] || "elixir"
    page = 1
    repositories = Repositories.list(language, page)

    socket =
      socket
      |> assign(language: language)
      |> assign(page: page)
      |> update_repositories(repositories)

    {:noreply, socket}
  end

  def handle_event("load_more", _, socket) do
    language = socket.assigns.language
    page = socket.assigns.page + 1
    repositories = Repositories.list(language, page)

    socket =
      socket
      |> update_repositories(repositories)
      |> assign(page: page)

    {:noreply, socket}
  end

  defp update_repositories(socket, repositories) do
    case repositories do
      {:error, message} ->
        socket |> put_flash(:error, message) |> stream(:repositories, [])

      repositories ->
        stream(socket, :repositories, repositories)
    end
  end
end
