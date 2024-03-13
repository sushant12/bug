defmodule Sssi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SssiWeb.Telemetry,
      Sssi.Repo,
      {DNSCluster, query: Application.get_env(:sssi, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Sssi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Sssi.Finch},
      # Start a worker by calling: Sssi.Worker.start_link(arg)
      # {Sssi.Worker, arg},
      # Start to serve requests, typically the last entry
      SssiWeb.Endpoint,
      Handin.BuildSupervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sssi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SssiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
