defmodule Fyoog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FyoogWeb.Telemetry,
      # Start the Ecto repository
      Fyoog.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fyoog.PubSub},
      # Start Finch
      {Finch, name: Fyoog.Finch},
      # Start the Endpoint (http/https)
      FyoogWeb.Endpoint
      # Start a worker by calling: Fyoog.Worker.start_link(arg)
      # {Fyoog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fyoog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FyoogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
