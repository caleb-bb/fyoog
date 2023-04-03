defmodule Fyoog.VideosTest do
  use Fyoog.DataCase

  alias Fyoog.Videos

  describe "videos" do
    alias Fyoog.Videos.Video

    import Fyoog.VideosFixtures

    @invalid_attrs %{bucket: nil, key: nil, md5header: nil}

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Videos.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Videos.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      valid_attrs = %{bucket: "some bucket", key: "some key", md5header: "some md5header"}

      assert {:ok, %Video{} = video} = Videos.create_video(valid_attrs)
      assert video.bucket == "some bucket"
      assert video.key == "some key"
      assert video.md5header == "some md5header"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      update_attrs = %{bucket: "some updated bucket", key: "some updated key", md5header: "some updated md5header"}

      assert {:ok, %Video{} = video} = Videos.update_video(video, update_attrs)
      assert video.bucket == "some updated bucket"
      assert video.key == "some updated key"
      assert video.md5header == "some updated md5header"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video(video, @invalid_attrs)
      assert video == Videos.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Videos.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Videos.change_video(video)
    end
  end
end
