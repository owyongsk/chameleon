defmodule Chameleon do
  use Application
  require Logger

  def start(_type, _args) do
    port =
      case System.get_env("PORT") do
        port when is_binary(port) -> String.to_integer(port)
        nil -> 80 # default port
      end

    children = [
      Plug.Adapters.Cowboy.child_spec(:http,
        Chameleon.ChameleonPlug, [], port: port)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
