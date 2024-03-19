defmodule GitSmart.Repositories.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w/avatar_url description forks git_id language full_name open_issues html_url watchers_count/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "repositories" do
    field :avatar_url, :string
    field :description, :string
    field :forks, :integer
    field :full_name, :string
    field :git_id, :integer
    field :html_url, :string
    field :language, :string
    field :open_issues, :integer
    field :watchers_count, :integer

    timestamps()
  end

  @doc false
  def changeset(repository, attrs) do
    repository
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:git_id)
  end
end
