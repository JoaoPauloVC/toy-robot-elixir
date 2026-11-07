defmodule ToyRobot.Robo do
  @moduledoc """
  Representa um robô e suas operações.
  """
  defstruct posicao_x: 0, posicao_y: 0, direcao: :norte

  alias ToyRobot.Robo

  @doc """
  Move o robô uma coordenada na direção que estiver olhando.

  ## Examples

      iex> alias ToyRobot.Robo
      ToyRobot.Robo
      iex> robo = %Robo{posicao_y: 0, posicao_x: 0, direcao: :norte}
      %Robo{posicao_y: 0, posicao_x: 0, direcao: :norte}
      iex> robo |> Robo.mover()
      %Robo{posicao_y: 1, posicao_x: 0, direcao: :norte}
      iex> robo |> Robo.mover() |> Robo.mover() |> Robo.mover()
      %Robo{posicao_y: 3, posicao_x: 0, direcao: :norte}
  """
  def mover(%Robo{direcao: :norte} = robo), do: robo |> mover_norte()
  def mover(%Robo{direcao: :sul} = robo), do: robo |> mover_sul()
  def mover(%Robo{direcao: :leste} = robo), do: robo |> mover_leste()
  def mover(%Robo{direcao: :oeste} = robo), do: robo |> mover_oeste()

  defp mover_leste(%Robo{} = robo), do: %Robo{robo | posicao_x: robo.posicao_x + 1}
  defp mover_oeste(%Robo{} = robo), do: %Robo{robo | posicao_x: robo.posicao_x - 1}
  defp mover_norte(%Robo{} = robo), do: %Robo{robo | posicao_y: robo.posicao_y + 1}
  defp mover_sul(%Robo{} = robo), do: %Robo{robo | posicao_y: robo.posicao_y - 1}
end
