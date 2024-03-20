defmodule GitSmartWeb.PageLive.IndexTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest
  import Mock
  alias GitSmart.Repositories

  setup_with_mocks([
    {Repositories, [], list: fn _, _ -> {:error, "Rate limit exceeded"} end},
    {Repositories, [], list_all_saved_git_ids: fn -> [] end},
    {Repositories, [], create: fn _ -> nil end}
  ]) do
    {:ok, %{}}
  end

  describe "render/1 render the default important elements" do
    test "render the index template", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      ["Elixir", "JavaScript", "Java", "Rust", "Go"]
      |> Enum.each(fn language ->
        assert has_element?(lv, "a", language)
      end)
    end

    test "throw error message", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")
      assert has_element?(lv, "p", "Rate limit exceeded")
    end
  end
end
