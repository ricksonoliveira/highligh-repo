defmodule HighlightRepo.Services.RepoServiceTest do
  use HighlightRepo.DataCase
  alias HighlightRepo.{Services.RepoService, GitRepos}

  @language "elixir"

  test "repos_info/1 will store into database and return" do
    assert RepoService.repos_info(@language) |> Enum.count() == 10
    assert GitRepos.list_repos() |> Enum.count() == 10
  end

  test "repos_info/1 will return github api response" do
    assert GitRepos.list_repos() |> Enum.count() == 0
    assert RepoService.repos_info("") == {:error, "Github api not available at the moment, please try again later"}
  end
end
