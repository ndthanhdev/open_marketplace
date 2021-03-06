defmodule Backend do
  @moduledoc """
  Backend keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_message() do
    Backend.Counter.get()
  end

  def increase do
    Backend.Counter.increase()

    {fqdn, _exit_status} = System.cmd("hostname", ["-f"])
    fqdn = String.trim(fqdn)

    value = Backend.Counter.get()

    "value: #{value}, fqdn: #{fqdn}"
  end
end
