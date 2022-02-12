defmodule HighlightRepo.Services.RepoService do
  @moduledoc """
  RepoService
  """
  alias HighlightRepo.{Services.GithubService, GitRepos}

  @spec repos_info(any) :: any
  def repos_info(language) do
     response = GithubService.get_repos_by_language(language)
     |> (Enum.map (fn repo ->
        owner = repo["owner"]
        GitRepos.create_git_repo_with_owner(
          %{
            name: repo["full_name"],
            description: repo["description"],
            forks: repo["forks"],
            stars: repo["stargazers_count"],
            url: repo["html_url"],
          },
          %{
            avatar_url: owner["avatar_url"],
            name: owner["login"],
            url: owner["html_url"]
          })
     end))

     response
  end
end
