defmodule GitSmart.Repositories.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(avatar_url description forks git_id language full_name open_issues html_url)a
  @fields ~w()a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "repositories" do
    field :avatar_url, :string
    field :description, :string
    field :forks, :integer
    field :git_id, :integer
    field :language, :string
    field :full_name, :string
    field :open_issues, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields ++ @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:git_id)
  end
end
