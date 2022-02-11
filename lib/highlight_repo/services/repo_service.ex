defmodule HighlightRepo.Services.RepoService do
@moduledoc """
RepoService
"""
  alias HighlightRepo.Services.GithubService

  def repos_info(language) do
    response = GithubService.get_repos_by_language(language)
    response
  end
end
