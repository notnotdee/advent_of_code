defmodule DayTwo do
  @moduledoc """
  A -> Rock       X -> Rock
  B -> Paper      Y -> Paper
  C -> Scissors   Z -> Scissors
  """

  @puzzle_input File.read!("lib/day_two/day_two_input.txt")
                |> String.split("\n", trim: true)

  @strategy_guide %{
    "A" => %{X: 4, Y: 8, Z: 3},
    "B" => %{X: 1, Y: 5, Z: 9},
    "C" => %{X: 7, Y: 2, Z: 6}
  }

  def part_one do
    @puzzle_input
    |> Enum.map(&String.split/1)
    |> Enum.map(&calculate_scores/1)
    |> Enum.reduce(0, fn input, acc -> input + acc end)
  end

  def calculate_scores([opponent, response]),
    do: @strategy_guide[opponent][response |> String.to_atom()]
end
