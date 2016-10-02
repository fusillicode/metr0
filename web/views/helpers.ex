defmodule Metr0.ViewHelpers do
  alias Guardian.Plug, as: GuardianPlug

  def active_on_current(%{request_path: path}, path), do: "active"
  def active_on_current(_, _), do: ""

  def logged_in?(conn), do: GuardianPlug.authenticated?(conn)
  def current_user(conn), do: GuardianPlug.current_resource(conn)
end
