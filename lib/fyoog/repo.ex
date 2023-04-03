defmodule Fyoog.Repo do
  use Ecto.Repo,
    otp_app: :fyoog,
    adapter: Ecto.Adapters.Postgres
end
