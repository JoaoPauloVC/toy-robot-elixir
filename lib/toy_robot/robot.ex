defmodule ToyRobot.Robo do
  @moduledoc """
  Representa um robô e suas operações.
  """
  defstruct leste: 0, norte: 0, direcao: :norte

  alias ToyRobot.Robo

  @doc """
  Move o robô uma coordenada na direção que estiver olhando.

  ## Examples

      iex> alias ToyRobot.Robo
      ToyRobot.Robo
      iex> robo = %Robo{norte: 0, leste: 0, direcao: :norte}
      %Robo{norte: 0, leste: 0, direcao: :norte}
      iex> robo |> Robo.mover()
      %Robo{norte: 1, leste: 0, direcao: :norte}
      iex> robo |> Robo.mover() |> Robo.mover() |> Robo.mover()
      %Robo{norte: 3, leste: 0, direcao: :norte}
  """
  def mover(%Robo{direcao: direcao} = robo) do
    case direcao do
      :leste -> robo |> mover_leste()
      :oeste -> robo |> mover_oeste()
      :norte -> robo |> mover_norte()
      :sul -> robo |> mover_sul()
    end
  end

  @doc """
    Faz o robô rotacionar para a esquerda.

    ## Examples

    iex> alias ToyRobot.Robo
    ToyRobot.Robo
    iex> robo = %Robo{}
    %Robo{norte: 0, leste: 0, direcao: :norte}
    iex> robo |> Robo.rotacionar_esquerda()
    %Robo{norte: 0, leste: 0, direcao: :oeste}
  """
  def rotacionar_esquerda(%Robo{direcao: direcao} = robo) do
    case direcao do
      :leste -> %Robo{robo | direcao: :norte}
      :oeste -> %Robo{robo | direcao: :sul}
      :norte -> %Robo{robo | direcao: :oeste}
      :sul -> %Robo{robo | direcao: :leste}
    end
  end

  @doc """
  Faz o robô rotacionar para a direita.

  ## Examples

  iex> alias ToyRobot.Robo
  ToyRobot.Robo
  iex> robo = %Robo{}
  %Robo{norte: 0, leste: 0, direcao: :norte}
  iex> robo |> Robo.rotacionar_direita()
  %Robo{norte: 0, leste: 0, direcao: :leste}
  """
  def rotacionar_direita(%Robo{direcao: direcao} = robo) do
    case direcao do
      :leste -> %Robo{robo | direcao: :sul}
      :oeste -> %Robo{robo | direcao: :norte}
      :norte -> %Robo{robo | direcao: :leste}
      :sul -> %Robo{robo | direcao: :oeste}
    end
  end

  defp mover_leste(%Robo{} = robo), do: %Robo{robo | leste: robo.leste + 1}
  defp mover_oeste(%Robo{} = robo), do: %Robo{robo | leste: robo.leste - 1}
  defp mover_norte(%Robo{} = robo), do: %Robo{robo | norte: robo.norte + 1}
  defp mover_sul(%Robo{} = robo), do: %Robo{robo | norte: robo.norte - 1}
end
