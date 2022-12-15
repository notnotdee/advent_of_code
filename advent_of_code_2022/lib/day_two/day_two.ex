defmodule DayTwo do
  @moduledoc """
  A -> Rock       X -> Rock
  B -> Paper      Y -> Paper
  C -> Scissors   Z -> Scissors
  """

  @puzzle_input File.read!("lib/day_two/day_two_input.txt")
                |> String.split("\n", trim: true)

  @part_one_strategy_guide %{
    "A" => %{X: 4, Y: 8, Z: 3},
    "B" => %{X: 1, Y: 5, Z: 9},
    "C" => %{X: 7, Y: 2, Z: 6}
  }

  @part_two_strategy_guide %{
    "A" => %{X: 3, Y: 4, Z: 8},
    "B" => %{X: 1, Y: 5, Z: 9},
    "C" => %{X: 2, Y: 6, Z: 7}
  }

  def part_one do
    @puzzle_input
    |> Enum.map(&String.split/1)
    |> Enum.map(&calculate_scores(&1, @part_one_strategy_guide))
    |> Enum.reduce(0, fn input, acc -> input + acc end)
  end

  def part_two do
    @puzzle_input
    |> Enum.map(&String.split/1)
    |> Enum.map(&calculate_scores(&1, @part_two_strategy_guide))
    |> Enum.reduce(0, fn input, acc -> input + acc end)
  end

  def calculate_scores([opponent, response], input),
    do: input[opponent][String.to_atom(response)]
end
