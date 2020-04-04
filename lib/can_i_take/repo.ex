defmodule CanITake.Repo do
  use Ecto.Repo,
    otp_app: :can_i_take,
    adapter: Ecto.Adapters.Postgres
end
