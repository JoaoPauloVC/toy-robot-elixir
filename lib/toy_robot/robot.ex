defmodule ToyRobot.Robot do
  defstruct north: 0, east: 0, facing: :north

  alias ToyRobot.Robot

  @doc """
    Moves the robot forward one space based on its current direction.

    ## Examples

        iex> alias ToyRobot.Robot
        ToyRobot.Robot
        iex> robot = %Robot{north: 0, facing: :north}
        %Robot{north: 0, facing: :north}
        iex> robot |> Robot.move
        %Robot{north: 1}
  """
  def move(%Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :south -> robot |> move_south
      :east -> robot |> move_east
      :west -> robot |> move_west
    end
  end

  defp move_east(%Robot{} = robot), do: %Robot{robot | east: robot.east + 1}
  defp move_west(%Robot{} = robot), do: %Robot{robot | east: robot.east - 1}
  defp move_north(%Robot{} = robot), do: %Robot{robot | north: robot.north + 1}
  defp move_south(%Robot{} = robot), do: %Robot{robot | north: robot.north - 1}

  @doc """
    Turns the robot left.

    ## Examples

        iex> alias ToyRobot.Robot
        ToyRobot.Robot
        iex> robot = %Robot{facing: :north}
        %Robot{facing: :north}
        iex> robot |> Robot.turn_left()
        %Robot{facing: :west}
  """
  def turn_left(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :west
      :west -> :south
      :south -> :east
      :east -> :north
    end

    %Robot{robot | facing: new_facing}
  end

  @doc """
    Turns the robot right.

    ## Examples

        iex> alias ToyRobot.Robot
        ToyRobot.Robot
        iex> robot = %Robot{facing: :north}
        %Robot{facing: :north}
        iex> robot |> Robot.turn_right()
        %Robot{facing: :east}
  """
  def turn_right(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end

    %Robot{robot | facing: new_facing}
  end
end
