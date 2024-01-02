defmodule PhoenixE2e.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_e2e,
    adapter: Ecto.Adapters.Postgres
end
