defmodule ToyRobot.Simulacao do
  alias ToyRobot.{Robo, Mesa, Simulacao}

  @moduledoc """
  Comportamentos relativos à junção de Robô e Mesa num mesmo espaço, formando uma simulação.
  """
  defstruct [:robo, :mesa]

  @doc """
  Simula o posicionamento do robô em uma mesa.

  ## Examples

  Quando o posicionamento é válido:

      iex> alias ToyRobot.{Robo, Mesa, Simulacao}
      [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
      iex> mesa = %Mesa{}
      %Mesa{limite_leste: 4, limite_norte: 4}
      iex> posicionamento = %{norte: 0, leste: 0, direcao: :norte}
      %{norte: 0, leste: 0, direcao: :norte}
      iex> Simulacao.posicionar(mesa, posicionamento)

      {
        :ok,
        %Simulacao{
          mesa: mesa,
            robo: %Robo{
              norte: posicionamento.norte,
              leste: posicionamento.leste,
              direcao: posicionamento.direcao}
        }
      }

  Quando o posicionamento é inválido:

      iex> alias ToyRobot.{Robo, Mesa, Simulacao}
      [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
      iex> mesa = %Mesa{}
      %Mesa{limite_leste: 4, limite_norte: 4}
      iex> posicionamento = %{norte: 6, leste: 0, direcao: :norte}
      %{norte: 6, leste: 0, direcao: :norte}
      iex> Simulacao.posicionar(mesa, posicionamento)

      {:erro, :posicionamento_invalido}
  """
  def posicionar(%Mesa{} = mesa, posicionamento) do
    if mesa |> Mesa.posicao_valida?(posicionamento) do
      {:ok, %Simulacao{mesa: mesa, robo: struct(Robo, posicionamento)}}
    else
      {:erro, :posicionamento_invalido}
    end
  end
end
