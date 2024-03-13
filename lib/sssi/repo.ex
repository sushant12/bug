defmodule Sssi.Repo do
  use Ecto.Repo,
    otp_app: :sssi,
    adapter: Ecto.Adapters.Postgres
end
