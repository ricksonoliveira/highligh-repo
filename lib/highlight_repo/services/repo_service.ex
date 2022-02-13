defmodule HighlightRepo.Services.RepoService do
  @moduledoc """
  RepoService
  """
  alias HighlightRepo.{Services.GithubService, GitRepos}

  @spec repos_info(any) :: list | {:error, <<_::496>> | Jason.DecodeError.t()}
  def repos_info(language) do
    case GithubService.get_repos_by_language(language) do
      {:ok, response} ->
        {:ok, Enum.map(response, fn repo ->
          owner = repo["owner"]
          {:ok, repo} = GitRepos.fetch_or_create_git_repo_with_owner(
            repo["name"],
            %{
              name: repo["name"],
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
          repo
        end)}
      {:error, message} ->
        {:error, message}
    end
  end
end
