defmodule HighlightRepo.Services.GithubService do
  @moduledoc """
  GithubService
  """
  @github_repos_api "https://api.github.com/search/repositories"

  defp call_github_api(language) do
    headers = %{
       "accept" => "application/json"
    }
    url = @github_repos_api <> "?q=language:#{language}&sort=stars&order=desc&page=1&per_page=1"

    {:ok, response} = HTTPoison.get(url, headers)
    Jason.decode(response.body)
  end

  def get_repos_by_language(language) do
    {:ok, repos} = call_github_api(language)
    repos["items"]
  end
end
