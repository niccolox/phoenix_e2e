ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PhoenixE2e.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
