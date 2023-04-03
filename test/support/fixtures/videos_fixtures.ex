defmodule Fyoog.VideosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fyoog.Videos` context.
  """

  @doc """
  Generate a video.
  """
  def video_fixture(attrs \\ %{}) do
    {:ok, video} =
      attrs
      |> Enum.into(%{
        bucket: "some bucket",
        key: "some key",
        md5header: "some md5header"
      })
      |> Fyoog.Videos.create_video()

    video
  end
end
