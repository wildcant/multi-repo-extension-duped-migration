defmodule DataPipelineCronPocWeb.PageController do
  use DataPipelineCronPocWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
