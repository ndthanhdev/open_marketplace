defmodule Collection.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(
      conn,
      200,
      Poison.encode!(%{
        id: "123456",
        layoutIndexs: [%{
          id: "1",
          minWidth: 0,
          minHeight: 0,
        }],
        layoutData: %{
          a: %{
            id: "1",
          }
        }
      })
    )
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
