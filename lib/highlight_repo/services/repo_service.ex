defmodule HighlightRepo.Services.RepoService do
  @moduledoc """
  RepoService
  """
  alias HighlightRepo.Services.GithubService

  @spec repos_info(any) :: any
  def repos_info(language) do
    response = GithubService.get_repos_by_language(language)
    response
  end
end
