defmodule Forecast.Mixfile do
  use Mix.Project

  def project do
    [
      app: :forecast,
      version: "0.0.1",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      escript: escript_config,
      name: "Forecast",
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      { :httpoison, "~> 0.7" },
      { :ex_doc,    github: "elixir-lang/ex_doc" },
      { :earmark,   ">= 0.0.0" },
      { :exprintf,  github: "parroty/exprintf" },
      { :erlsom,    github: "willemdj/erlsom" },
    ]
  end

  def escript_config do
    [ main_module: Forecast.CLI ]
  end

end
