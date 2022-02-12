defmodule HighlightRepoWeb.RepoController do
  use HighlightRepoWeb, :controller

  alias HighlightRepo.Services.RepoService

  @spec highlighted_repos(Plug.Conn.t(), map) :: Plug.Conn.t()
  def highlighted_repos(conn, %{"language" => language}) do
    {:ok, response} = RepoService.repos_info(language)

    render(conn, "repos_info.html", %{"data" => response})
  end
end

# Service (Call on Github API (Github Service)) -> Context -> Schema
