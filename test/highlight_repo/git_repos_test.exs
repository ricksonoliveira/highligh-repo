defmodule HighlightRepo.GitReposTest do
  use HighlightRepo.DataCase

  alias HighlightRepo.{Repo, GitRepos, Repos.GitRepo, Owners.Owner}

  describe "repos" do

    @repo %{
      description: "Elixir Programming Language",
      forks: 2833,
      name: "elixir",
      stars: 1999,
      url: "github.com/elixir-lang/elixir"
    }
    @owner %{
      avatar_url: "https://my-image.com/fake-image",
      name: "ricksonoliveira",
      url: "github.com/ricksonoliveira"
    }
    @invalid_attrs %{description: nil, forks: nil, name: nil, stars: nil, url: nil}

    defp git_repos_fixture do
      %GitRepo{}
      |> GitRepo.changeset(@repo)
      |> Ecto.Changeset.put_assoc(:owner, @owner)
      |> Repo.insert()
    end

    test "list_repos/0 returns all repos" do
      git_repos = git_repos_fixture()
      assert GitRepos.list_repos() |> Enum.count() == 1
    end

    test "get_git_repos!/1 returns the git_repos with given id" do
      {:ok, git_repos} = git_repos_fixture()
      assert GitRepos.get_git_repo!(git_repos.id) == git_repos
    end

    test "create_git_repos/1 with valid data creates a git_repos" do
      assert {:ok, %GitRepo{} = git_repos} = GitRepos.create_git_repo_with_owner(@repo, @owner)
      assert git_repos.description == "Elixir Programming Language"
      assert git_repos.name == "elixir"
      assert git_repos.owner.name == "ricksonoliveira"
    end

    test "create_git_repos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GitRepos.create_git_repo_with_owner(@invalid_attrs, %{})
      assert {:error, %Ecto.Changeset{}} = %Owner{} |> Owner.changeset(%{}) |> Repo.insert()
    end
  end
end
