defmodule HighlightRepoWeb.RepoControllerTest do
  @moduledoc """
  RepoControllerTest
  """
  use HighlightRepoWeb.ConnCase

  test "get highlighted repos endpoint", %{conn: conn} do
    conn =
      conn
      |> post(Routes.repo_path(conn, :highlighted_repos), %{language: "elixir"})

    assert {:ok, response} = conn
  end
end
