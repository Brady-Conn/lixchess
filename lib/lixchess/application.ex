defmodule Lixchess.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LixchessWeb.Telemetry,
      Lixchess.Repo,
      {DNSCluster, query: Application.get_env(:lixchess, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Lixchess.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Lixchess.Finch},
      # Start a worker by calling: Lixchess.Worker.start_link(arg)
      # {Lixchess.Worker, arg},
      # Start to serve requests, typically the last entry
      LixchessWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lixchess.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LixchessWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
