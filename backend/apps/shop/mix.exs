defmodule Shop.MixProject do
  use Mix.Project

  def project do
    [
      app: :shop,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Shop.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
      {:jason, "~> 1.2"},
      {:commanded, "~> 1.2"},
      {:commanded_extreme_adapter, "~> 1.1"},
      {:absinthe, "~> 1.5"},
      {:commanded_ecto_projections, "~> 1.2"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:commanded_eventstore_adapter, "~> 1.2"},
      {:eventstore, "~> 1.3"},
      {:vex, ">= 0.0.0"},
      {:exconstructor, ">= 1.0.0"},
      {:uuid, ">= 1.0.0"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      # test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
