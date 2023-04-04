defmodule Fyoog.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :bucket, :string, redact: true
    field :key, :string, redact: true
    field :md5header, :string
    field :title, :string
    field :description, :string

    timestamps()
  end

  @required [:bucket, :key, :md5header, :title]
  @all @required ++ [:description]

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, @all)
    |> validate_required(@required)
  end
end
