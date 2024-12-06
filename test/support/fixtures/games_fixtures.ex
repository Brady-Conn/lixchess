defmodule Lixchess.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lixchess.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        fenstring: "some fenstring"
      })
      |> Lixchess.Games.create_game()

    game
  end
end
