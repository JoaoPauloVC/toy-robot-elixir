defmodule ToyRobot.Simulacao do
  alias ToyRobot.{Robo, Mesa, Simulacao}

  @moduledoc """
  Comportamentos relativos à junção de Robô e Mesa num mesmo espaço, formando uma simulação.
  """
  defstruct robo: %Robo{}, mesa: %Mesa{}

  @doc """
  Simula o posicionamento do robô em uma mesa.

  ## Examples

  ### Quando o posicionamento é válido:

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

  ### Quando o posicionamento é inválido:

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

  @doc """
    Move o robô uma unidade na direção em que ele estiver olhando, a menos que o movimento esteja alem dos limites da mesa.

    ## Examples

    ### Um movimento válido

    iex> alias ToyRobot.{Robo, Mesa, Simulacao}
    [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
    iex> mesa = %Mesa{}
    %Mesa{limite_leste: 4, limite_norte: 4}
    iex> simulacao = %Simulacao{mesa: mesa}
    %Simulacao{
      robo: %Robo{
              norte: 0,
              leste: 0,
              direcao: :norte
            },
      mesa: mesa,
    }
    iex> simulacao |> Simulacao.mover_robo()
    {
      :ok,
      %Simulacao{
        robo: %Robo{
                norte: 1,
                leste: 0,
                direcao: :norte
              },
        mesa: mesa
      }
    }

    ### Um movimento inválido:

    iex> alias ToyRobot.{Robo, Mesa, Simulacao}
    [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
    iex> mesa = %Mesa{}
    %Mesa{limite_leste: 4, limite_norte: 4}
    iex> simulacao = %Simulacao{mesa: mesa, robo: %Robo{norte: 4, leste: 0, direcao: :norte}}
    %Simulacao{
      mesa: mesa,
      robo: %Robo{
              norte: 4,
              leste: 0,
              direcao: :norte
            }
    }
    iex> simulacao |> Simulacao.mover_robo()
    {:erro, :no_limite_da_mesa}
  """
  def mover_robo(%Simulacao{robo: robo, mesa: mesa} = simulacao) do
    with posicao_final_robo <- robo |> Robo.mover(),
         true <- mesa |> Mesa.posicao_valida?(posicao_final_robo) do
      # Robo foi movido e posicao_valida? retorna que a posição é possível
      {
        :ok,
        %Simulacao{simulacao | robo: posicao_final_robo}
      }
    else
      # posicao_valida? retorna false (não é possível o robo ocupar a posicao_final)
      false -> {:erro, :no_limite_da_mesa}
    end
  end

  @doc """
    Rotacaiona o robô para a esquerda (anti-horário).

    ## Examples

    iex> alias ToyRobot.{Robo, Mesa, Simulacao}
    [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
    iex> simulacao = %Simulacao{}
    %Simulacao{
      mesa: %Mesa{limite_leste: 4, limite_norte: 4},
      robo: %Robo{
              norte: 0,
              leste: 0,
              direcao: :norte
            }
    }
    iex> simulacao |> Simulacao.rotacionar_robo_esquerda()
    {
      :ok,
      %Simulacao{
        mesa: %Mesa{limite_leste: 4, limite_norte: 4},
        robo: %Robo{
                norte: 0,
                leste: 0,
                direcao: :oeste
              }
      }
    }
  """
  def rotacionar_robo_esquerda(%Simulacao{} = simulacao) do
    {:ok, %Simulacao{mesa: simulacao.mesa, robo: simulacao.robo |> Robo.rotacionar_esquerda()}}
  end

  @doc """
    Rotaciona o robô para a direita (horário).

    ## Examples

    iex> alias ToyRobot.{Robo, Mesa, Simulacao}
    [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
    iex> simulacao = %Simulacao{}
    %Simulacao{
      mesa: %Mesa{limite_leste: 4, limite_norte: 4},
      robo: %Robo{
              norte: 0,
              leste: 0,
              direcao: :norte
            }
    }
    iex> simulacao |> Simulacao.rotacionar_robo_direita()
    {
      :ok,
      %Simulacao{
        mesa: %Mesa{limite_leste: 4, limite_norte: 4},
        robo: %Robo{
                norte: 0,
                leste: 0,
                direcao: :leste
              }
      }
    }
  """
  def rotacionar_robo_direita(%Simulacao{} = simulacao) do
    {:ok, %Simulacao{mesa: simulacao.mesa, robo: simulacao.robo |> Robo.rotacionar_direita()}}
  end

  @doc """
    Retorna a posição atual do robo.

    ## Examples

    iex> alias ToyRobot.{Robo, Mesa, Simulacao}
    [ToyRobot.Robo, ToyRobot.Mesa, ToyRobot.Simulacao]
    iex> simulacao = %Simulacao{}
    %Simulacao{
      mesa: %Mesa{},
      robo: %Robo{}
    }
    iex> simulacao |> Simulacao.reportar()
    %Robo{leste: 0, norte: 0, direcao: :norte}
  """
  def reportar(%Simulacao{robo: robo}) do
    robo
  end
end
