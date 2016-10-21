defmodule GaragePi.RemoteController do
  use GaragePi.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end

  def press(conn, _params) do
    client = [
      ip: System.get_env("IP"),
      user: System.get_env("USER"),
      password: System.get_env("PASSWORD")
    ]
    spawn fn () ->
      ElixirPins.turn_on 18, client
      :timer.sleep(1000)
      ElixirPins.turn_off 18, client
    end
    json conn, "ok"
  end







end
