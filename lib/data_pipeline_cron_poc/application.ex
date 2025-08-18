defmodule DataPipelineCronPoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DataPipelineCronPocWeb.Telemetry,
      DataPipelineCronPoc.Repo,
      {DNSCluster,
       query: Application.get_env(:data_pipeline_cron_poc, :dns_cluster_query) || :ignore},
      {Oban,
       AshOban.config(
         Application.fetch_env!(:data_pipeline_cron_poc, :ash_domains),
         Application.fetch_env!(:data_pipeline_cron_poc, Oban)
       )},
      {Phoenix.PubSub, name: DataPipelineCronPoc.PubSub},
      # Start a worker by calling: DataPipelineCronPoc.Worker.start_link(arg)
      # {DataPipelineCronPoc.Worker, arg},
      # Start to serve requests, typically the last entry
      DataPipelineCronPocWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DataPipelineCronPoc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DataPipelineCronPocWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
