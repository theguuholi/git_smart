defmodule GitSmart.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :avatar_url, :string
      add :description, :text
      add :forks, :integer
      add :git_id, :integer
      add :watchers_count, :integer
      add :language, :string
      add :full_name, :string
      add :open_issues, :integer
      add :html_url, :string

      timestamps()
    end

    create unique_index(:repositories, [:git_id])
  end
end
