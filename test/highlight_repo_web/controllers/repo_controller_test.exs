defmodule HighlightRepoWeb.RepoControllerTest do
  @moduledoc """
  RepoControllerTest
  """
  use HighlightRepoWeb.ConnCase

  test "highlighted repos endpoint", %{conn: conn} do
    assert post(conn, Routes.repo_path(conn, :highlighted_repos), %{language: "elixir"}).status == 200
  end

  test "highlighted repos with error", %{conn: conn} do
    assert post(conn, Routes.repo_path(conn, :highlighted_repos), %{language: ""}).status == 400
  end
end
