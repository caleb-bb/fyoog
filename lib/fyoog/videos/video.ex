defmodule Fyoog.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :bucket, :string
    field :key, :string
    field :md5header, :string

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:bucket, :key, :md5header])
    |> validate_required([:bucket, :key, :md5header])
  end
end
