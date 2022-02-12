defmodule HighlightRepo.Services.GithubServiceTest do
  use HighlightRepo.DataCase
  alias HighlightRepo.Services.GithubService

  @language "elixir"

  test "get_repos_by_language/1 will return github api response" do
    repo =
      GithubService.get_repos_by_language(@language)
      |> Enum.map(&%{forks: &1["forks"], language: &1["language"], full_name: &1["full_name"]})
      |> List.first()

    assert ^repo = %{forks: 2833, full_name: "elixir-lang/elixir", language: "Elixir"}
  end

  test "get_repos_by_language/1 will return github api with error" do
    repo = GithubService.get_repos_by_language("")

    assert ^repo = "Github api not available at the moment, please try again later"
  end
end
