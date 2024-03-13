defmodule Sssi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sssi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Sssi.Accounts.create_user()

    user
  end
end
