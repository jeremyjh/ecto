defmodule Ecto.Adapter do
  @moduledoc """
  This module specifies the adapter API that an adapter is required to
  implement.
  """

  use Behaviour

  defmacrocallback __using__(opts :: Keyword.t) :: Macro.t

  @doc """
  Should start any connection pooling or supervision and return `{ :ok, pid }`
  or just `:ok` if nothing needs to be done. Return `{ :error, error }` if
  something went wrong.
  """
  defcallback start_link(Ecto.Repo.t) :: { :ok, pid } | :ok | { :error, term }

  @doc """
  Should stop any connection pooling or supervision started with `start_link/1`.
  """
  defcallback stop(Ecto.Repo.t) :: :ok

  @doc """
  Should fetch all results from the data store based on the given query.
  """
  defcallback all(Ecto.Repo.t, Ecto.Query.t) :: { :ok, [Record.t] } | { :error, term }

  @doc """
  Should store a single new entity in the data store. And return a primary key
  if one was created for the entity.
  """
  defcallback create(Ecto.Repo.t, Ecto.Entity.t) :: { :ok, nil | integer } | { :error, term }

  @doc """
  Should update an entity using the primary key as key.
  """
  defcallback update(Ecto.Repo.t, Ecto.Entity.t) :: :ok | { :error, term }

  @doc """
  Should update all entities matching the given query with the values given. The
  query will only have where expressions and a single from expression. Returns
  the number of affected entities.
  """
  defcallback update_all(Ecto.Repo.t, Ecto.Query.t, values :: Keyword.t) :: { :ok, :integer } | { :error, term }

  @doc """
  Should delete an entity using the primary key as key.
  """
  defcallback delete(Ecto.Repo.t, Ecto.Entity.t) :: :ok | { :error, term }

  @doc """
  Should delete all entities matching the given query. The query will only have
  where expressions and a single from expression. Returns the number of affected
  entities.
  """
  defcallback delete_all(Ecto.Repo.t, Ecto.Query.t) :: { :ok, :integer } | { :error, term }
end
