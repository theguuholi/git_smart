defmodule GitSmart.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "repositories" do
    field :avatar_url, :string
    field :description, :string
    field :forks, :integer
    field :git_id, :string
    field :language, :string
    field :name, :string
    field :open_issues, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(repository, attrs) do
    repository
    |> cast(attrs, [:avatar_url, :description, :forks, :git_id, :language, :name, :open_issues, :url])
    |> validate_required([:avatar_url, :description, :forks, :git_id, :language, :name, :open_issues, :url])
    |> unique_constraint(:git_id)
  end
end
