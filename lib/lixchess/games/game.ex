defmodule Lixchess.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :fenstring, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:fenstring])
    |> validate_required([:fenstring])
  end
end
