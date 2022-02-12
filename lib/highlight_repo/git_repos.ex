defmodule HighlightRepo.GitRepos do
  @moduledoc """
  The Repos context.
  """

  alias HighlightRepo.{Repos.GitRepo, Repo}

  @doc """
  Returns the list of repos.
  """
  def list_repos do
    Repo.all(GitRepo)
  end

  @spec get_git_repo!(any) :: nil | [%{optional(atom) => any}] | %{optional(atom) => any}
  @doc """
  Gets a single git_repos.
  """
  def get_git_repo!(id), do: Repo.get!(GitRepo, id) |> Repo.preload(:owner)

  @spec create_git_repo_with_owner(
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
          any
        ) :: any
  @doc """
  Creates a git_repos.
  """
  def create_git_repo_with_owner(attrs \\ %{}, owner) do
    %GitRepo{}
      |> GitRepo.changeset(attrs)
      |> Ecto.Changeset.put_assoc(:owner, owner)
      |> Repo.insert()
  end
end
