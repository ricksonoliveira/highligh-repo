defmodule HighlightRepo.GitReposTest do
  use HighlightRepo.DataCase

  alias HighlightRepo.GitRepos

  describe "repos" do
    alias HighlightRepo.Repos.GitRepo

    @invalid_attrs %{description: nil, forks: nil, name: nil, stars: nil, url: nil}

    defp git_repos_fixture do
      %GitRepo{}
    end

    test "list_repos/0 returns all repos" do
      git_repos = git_repos_fixture()
      assert GitRepos.list_repos() == [git_repos]
    end

    test "get_git_repos!/1 returns the git_repos with given id" do
      git_repos = git_repos_fixture()
      assert GitRepos.get_git_repos!(git_repos.id) == git_repos
    end

    test "create_git_repos/1 with valid data creates a git_repos" do
      valid_attrs = %{description: "some description", forks: "some forks", name: "some name", stars: "some stars", url: "some url"}

      assert {:ok, %GitRepo{} = git_repos} = GitRepos.create_git_repos(valid_attrs)
      assert git_repos.description == "some description"
      assert git_repos.forks == "some forks"
      assert git_repos.name == "some name"
      assert git_repos.stars == "some stars"
      assert git_repos.url == "some url"
    end

    test "create_git_repos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GitRepos.create_git_repos(@invalid_attrs)
    end
  end
end
