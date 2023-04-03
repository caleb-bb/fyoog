defmodule Fyoog.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :bucket, :string
      add :key, :string
      add :md5header, :string

      timestamps()
    end
  end
end
