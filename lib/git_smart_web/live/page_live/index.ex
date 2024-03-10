defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def handle_params(params, _, socket) do
    language = params["language"] || "elixir"
    page = params["page"] || "1"
    repositories = Repositories.list(language, page)
    socket = assign(socket, :repositories, repositories)

    {:noreply, socket}
  end
end
