defmodule DataPipelineCronPoc.Products.Product do
  use Ash.Resource,
    domain: DataPipelineCronPoc.Products,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "products"
    repo DataPipelineCronPoc.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :title, :string
    attribute :description, :string
    # attribute :price, :money
  end
end
