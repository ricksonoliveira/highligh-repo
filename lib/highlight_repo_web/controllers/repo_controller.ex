defmodule HighlightRepoWeb.RepoController do
  use HighlightRepoWeb, :controller

  def highlighted_repos(conn, %{"language" => language}) do
    {:ok, response} = RepoService.repos_info(language)

    render(conn, "repos_info.html", %{"data" => response})
  end
end

# Service (Call on Github API (Github Service)) -> Context -> Schema
