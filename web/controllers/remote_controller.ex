defmodule GaragePi.RemoteController do
  use GaragePi.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end

  def press(conn, _params) do
    spawn fn () ->
      ElixirPins.turn_on 18
      :timer.sleep(100)
      ElixirPins.turn_off 18
    end
    json conn, "ok"
  end







end
