defmodule ToyRobot.Mesa do
  @moduledoc """
    Representa a mesa, suas operações, e limites inerentes a ela.
  """
  defstruct limite_leste: 4, limite_norte: 4
  alias ToyRobot.Mesa

  @doc """
  Retorna TRUE se a posição (x,y) informada estiver dentro dos limites da Mesa criada

  ## Examples

      iex> alias ToyRobot.Mesa
      ToyRobot.Mesa
      iex> mesa = %Mesa{}
      %Mesa{limite_leste: 4, limite_norte: 4}
      iex> mesa |> Mesa.posicao_valida?(%{norte: 2, leste: 3})
      true
      iex> mesa |> Mesa.posicao_valida?(%{norte: 4, leste: 4})
      true
      iex> mesa |> Mesa.posicao_valida?(%{norte: 4, leste: 5})
      false
  """
  def posicao_valida?(
        %Mesa{limite_leste: limite_leste, limite_norte: limite_norte},
        %{norte: norte, leste: leste}
      ) do
    norte >= 0 && norte <= limite_norte &&
      leste >= 0 && leste <= limite_leste
  end
end
