defmodule Chameleon.ChameleonPlug do
  import Plug.Conn
  require Logger

  def init(options), do: options

  def call(conn, _opts) do
    HTTPoison.start

    filetype      = conn.request_path |> String.split(".") |> List.last
    content_type  = case String.downcase(filetype) do
                     "html" -> "text/html"
                     "txt"  -> "text/plain"
                     "css"  -> "text/css"
                     "js"   -> "text/javascript"
                     "vtt"  -> "text/vtt"
                     "jpg"  -> "image/jpeg"
                     "jpeg" -> "image/jpeg"
                     "png"  -> "image/png"
                     "ico"  -> "image/x-icon"
                     "pdf"  -> "application/pdf"
                     "json" -> "application/json"
                     _      -> "application/octet-stream"
                   end

    token       = System.get_env("DROPBOX_TOKEN")
    dropbox_url = "https://content.dropboxapi.com/2/files/download"
    headers     = ["Authorization":   "Bearer #{token}",
                   "Dropbox-API-Arg": "{\"path\":\"#{conn.request_path}\"}"]

    case HTTPoison.post(dropbox_url, "", headers) do
      {_, response} ->
        case response.status_code do
          200 ->
            Logger.info "#{response.status_code} #{conn.request_path}"
            conn
            |> put_resp_content_type(content_type)
            |> send_resp(response.status_code, response.body)
          _   ->
            Logger.info "#{response.status_code} #{conn.request_path}"
            conn
            |> put_status(:not_found)
            |> send_resp(response.status_code, response.body)
        end

    end
  end
end
