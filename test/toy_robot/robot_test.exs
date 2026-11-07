defmodule ToyRobot.RoboTest do
  use ExUnit.Case
  doctest ToyRobot.Robo
  alias ToyRobot.Robo

  describe "quando robo esta olhando para o norte" do
    setup do
      {:ok, %{robo: %Robo{leste: 0, norte: 0, direcao: :norte}}}
    end

    test "move um espaço para o norte", %{robo: robo} do
      robo = robo |> Robo.mover()
      assert robo.norte == 1
    end
  end

  describe "quando robo esta olhando para o sul" do
    setup do
      {:ok, %{robo: %Robo{leste: 0, norte: 0, direcao: :sul}}}
    end

    test "move um espaço para o sul", %{robo: robo} do
      robo = robo |> Robo.mover()
      assert robo.norte == -1
    end
  end

  describe "quando robo esta olhando para o leste" do
    setup do
      {:ok, %{robo: %Robo{leste: 0, norte: 0, direcao: :leste}}}
    end

    test "move um espaço para o leste", %{robo: robo} do
      robo = robo |> Robo.mover()
      assert robo.leste == 1
    end
  end

  describe "quando robo esta olhando para o oeste" do
    setup do
      {:ok, %{robo: %Robo{leste: 0, norte: 0, direcao: :oeste}}}
    end

    test "move um espaço para o oeste", %{robo: robo} do
      robo = robo |> Robo.mover()
      assert robo.leste == -1
    end
  end
end
