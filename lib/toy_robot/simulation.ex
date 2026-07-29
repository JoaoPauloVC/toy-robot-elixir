defmodule ToyRobot.Simulation do
  defstruct [:robot, :table]
  alias ToyRobot.{Simulation, Robot, Table}

  @doc """
  Simulates placing a robot on a table.

  ## Examples

      Valid placement:

      iex> alias ToyRobot.{Simulation, Robot, Table}
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> Simulation.place(table, %{north: 0, east: 0, facing: :north})
      {:ok,
       %Simulation{
       robot: %Robot{north: 0, east: 0, facing: :north},
       table: table}}

      Invalid placement:

      iex> alias ToyRobot.{Simulation, Robot, Table}
      iex> table = %Table{north_boundary: 4, east_boundary: 4}
      %Table{north_boundary: 4, east_boundary: 4}
      iex> Simulation.place(table, %{north: 6, east: 0, facing: :north})
      {:error, "Invalid placement"}

  """
  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
    {:ok,
     %Simulation{
      table: table,
      robot: struct(Robot, placement)
     }}
     else
      {:error, "Invalid placement"}
     end
  end
end
