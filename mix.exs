defmodule Qontakwa.MixProject do
  use Mix.Project

  def project do
    [
      app: :qontakwa,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mojito, "~> 0.7.10"},
      {:bypass, "~> 2.1", only: :test},
      {:jason, "~> 1.0"}
    ]
  end
end
