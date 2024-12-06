defmodule Lixchess.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :fenstring, :text

      timestamps(type: :utc_datetime)
    end
  end
end
