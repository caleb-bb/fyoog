defmodule Fyoog.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :bucket, :string
      add :key, :string
      add :md5header, :string
      add :title, :string
      add :description, :string

      timestamps()
    end
  end
end
