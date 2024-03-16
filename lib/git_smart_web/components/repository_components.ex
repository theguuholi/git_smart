defmodule GitSmartWeb.RepositoryComponents do
  use Phoenix.Component

  slot :action
  slot :details
  attr :link, :string, default: "#"
  attr :repository, :any

  def repository_item(assigns) do
    ~H"""
    <.link
      navigate={@link}
      class="flex space-x-3 p-2 bg-sky-50 hover:brightness-95 transition-all rounded-md"
    >
      <img src={@repository.avatar_url} class="h-6 w-6 rounded-full" />
      <div class="flex-1 space-y-4">
        <div class="flex items-center justify-between">
          <h3><%= @repository.full_name %></h3>
          <span>
            <strong>Watchers:</strong> <%= @repository.watchers_count %>
          </span>
        </div>

        <div class="flex items-center justify-between">
          <p class="text-xs text-zinc-400">
            <%= @repository.description %>
          </p>
          <%= render_slot(@action) %>
        </div>
        <%= render_slot(@details) || "" %>
      </div>
    </.link>
    """
  end
end
