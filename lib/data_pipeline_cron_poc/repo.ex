defmodule DataPipelineCronPoc.ObanRepo do
  use AshPostgres.Repo,
    otp_app: :data_pipeline_cron_poc

  @impl true
  def installed_extensions do
    # Add extensions here, and the migration generator will install them.
    ["ash-functions", AshMoney.AshPostgresExtension]
  end

  # Don't open unnecessary transactions
  # will default to `false` in 4.0
  @impl true
  def prefer_transaction? do
    false
  end

  @impl true
  def min_pg_version do
    %Version{major: 15, minor: 13, patch: 0}
  end
end

defmodule DataPipelineCronPoc.Repo do
  use AshPostgres.Repo,
    otp_app: :data_pipeline_cron_poc

  @impl true
  def installed_extensions do
    # Add extensions here, and the migration generator will install them.
    ["ash-functions", AshMoney.AshPostgresExtension]
  end

  # Don't open unnecessary transactions
  # will default to `false` in 4.0
  @impl true
  def prefer_transaction? do
    false
  end

  @impl true
  def min_pg_version do
    %Version{major: 15, minor: 13, patch: 0}
  end
end
