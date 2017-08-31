defmodule Chameleon.ChameleonPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    HTTPoison.start

    filepath      = Enum.join(conn.path_info, "/")
    [_, filetype] = List.last(conn.path_info) |> String.split(".")
    content_type  = case String.downcase(filetype) do
                     "html" -> "text/html"
                     "txt"  -> "text/plain"
                     "css"  -> "text/css"
                     "js"   -> "text/javascript"
                     "jpg"  -> "image/jpeg"
                     "jpeg" -> "image/jpeg"
                     "png"  -> "image/png"
                     "ico"  -> "image/x-icon"
                     _      -> "application/json"
                   end

    token       = System.get_env("DROPBOX_TOKEN")
    dropbox_url = "https://content.dropboxapi.com/2/files/download"
    headers     = ["Authorization":   "Bearer #{token}",
                   "Dropbox-API-Arg": "{\"path\":\"/#{filepath}\"}"]

    case HTTPoison.post(dropbox_url, "", headers) do
      {:ok, response } -> conn
        |> put_resp_content_type(content_type)
        |> send_resp(response.status_code, response.body)
      {:error, error } -> conn
        |> put_status(:not_found)
        |> send_resp(error.status_code, error.body)
    end
  end
end
