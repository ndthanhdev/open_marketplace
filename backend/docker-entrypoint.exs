#! /usr/bin/env elixir
root_path = "/open_marketplace/backend/"

IO.puts("Moving to shop")

Path.join(root_path, 'apps/shop')
|> File.cd!()

IO.puts("Setting up shop")
System.cmd("mix", ["setup_ecto"])

IO.puts("Moving to api")

Path.join(root_path, 'apps/api')
|> File.cd!()

IO.puts("Serving api")

System.cmd("iex", ["-S", "mix", "phx.server"])
