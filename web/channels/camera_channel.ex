defmodule GaragePi.CameraChannel do
  use Phoenix.Channel

  def join("camera:join", _message, socket) do
    {:ok, socket}
  end

  def handle_in("camera:listen", _message_, socket) do
    spawn fn -> continous_update(socket) end
    broadcast! socket, "watcher:update", %{}
    {:noreply, socket}
  end

  def continous_update(socket) do
    broadcast! socket, "watcher:update", %{}
    div(1000, 24)
    |> :timer.sleep
    continous_update socket
  end



end
