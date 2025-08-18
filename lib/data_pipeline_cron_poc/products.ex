defmodule DataPipelineCronPoc.Products do
  use Ash.Domain,
    otp_app: :data_pipeline_cron_poc

  resources do
    resource DataPipelineCronPoc.Products.Product
  end
end
