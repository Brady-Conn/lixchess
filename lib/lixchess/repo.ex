defmodule Lixchess.Repo do
  use Ecto.Repo,
    otp_app: :lixchess,
    adapter: Ecto.Adapters.Postgres
end
