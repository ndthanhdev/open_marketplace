defmodule BackendWeb.DefaultController do
  use BackendWeb, :controller

  def index(conn, _params) do
    message = Backend.get_message
    text(conn, message)
  end
end
