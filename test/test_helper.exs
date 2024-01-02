ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PhoenixE2e.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, PhoenixE2eWeb.Endpoint.url())
