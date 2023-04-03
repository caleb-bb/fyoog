defmodule FyoogWeb.VideoLiveTest do
  use FyoogWeb.ConnCase

  import Phoenix.LiveViewTest
  import Fyoog.VideosFixtures

  @create_attrs %{bucket: "some bucket", key: "some key", md5header: "some md5header"}
  @update_attrs %{
    bucket: "some updated bucket",
    key: "some updated key",
    md5header: "some updated md5header"
  }
  @invalid_attrs %{bucket: nil, key: nil, md5header: nil}

  defp create_video(_) do
    video = video_fixture()
    %{video: video}
  end

  describe "Index" do
    setup [:create_video, :register_and_log_in_user]

    test "lists all videos", %{conn: conn, video: video} do
      {:ok, _index_live, html} = live(conn, ~p"/videos")

      assert html =~ "Listing Videos"
      assert html =~ video.bucket
    end

    test "saves new video", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/videos")

      assert index_live |> element("a", "New Video") |> render_click() =~
               "New Video"

      assert_patch(index_live, ~p"/videos/new")

      assert index_live
             |> form("#video-form", video: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#video-form", video: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/videos")

      html = render(index_live)
      assert html =~ "Video created successfully"
      assert html =~ "some bucket"
    end

    test "updates video in listing", %{conn: conn, video: video} do
      {:ok, index_live, _html} = live(conn, ~p"/videos")

      assert index_live |> element("#videos-#{video.id} a", "Edit") |> render_click() =~
               "Edit Video"

      assert_patch(index_live, ~p"/videos/#{video}/edit")

      assert index_live
             |> form("#video-form", video: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#video-form", video: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/videos")

      html = render(index_live)
      assert html =~ "Video updated successfully"
      assert html =~ "some updated bucket"
    end

    test "deletes video in listing", %{conn: conn, video: video} do
      {:ok, index_live, _html} = live(conn, ~p"/videos")

      assert index_live |> element("#videos-#{video.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#videos-#{video.id}")
    end
  end

  describe "Show" do
    setup [:create_video, :register_and_log_in_user]

    test "displays video", %{conn: conn, video: video} do
      {:ok, _show_live, html} = live(conn, ~p"/videos/#{video}")

      assert html =~ "Show Video"
      assert html =~ video.bucket
    end

    test "updates video within modal", %{conn: conn, video: video} do
      {:ok, show_live, _html} = live(conn, ~p"/videos/#{video}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Video"

      assert_patch(show_live, ~p"/videos/#{video}/show/edit")

      assert show_live
             |> form("#video-form", video: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#video-form", video: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/videos/#{video}")

      html = render(show_live)
      assert html =~ "Video updated successfully"
      assert html =~ "some updated bucket"
    end
  end
end
