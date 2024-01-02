defmodule PhoenixE2e.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixE2eWeb.Telemetry,
      # Start the Ecto repository
      PhoenixE2e.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixE2e.PubSub},
      # Start Finch
      {Finch, name: PhoenixE2e.Finch},
      # Start the Endpoint (http/https)
      PhoenixE2eWeb.Endpoint
      # Start a worker by calling: PhoenixE2e.Worker.start_link(arg)
      # {PhoenixE2e.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixE2e.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixE2eWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
