defmodule DayOne do
  @puzzle_input File.read!("lib/day_one/day_one_input.txt") |> String.codepoints()
  @input_with_index @puzzle_input |> Enum.with_index()

  def part_one,
    do:
      @puzzle_input
      |> Enum.reduce(0, fn char, acc ->
        case char do
          "(" ->
            acc + 1

          ")" ->
            acc - 1
        end
      end)

  def part_two do
    {_acc, position} =
      @input_with_index
      |> Enum.reduce({1, -1}, fn {char, index}, {acc, position} ->
        next_acc =
          case char do
            "(" ->
              acc + 1

            ")" ->
              acc - 1
          end

        next_position =
          cond do
            position != -1 -> position
            next_acc == -1 -> index
            true -> position
          end

        {next_acc, next_position}
      end)

    position
  end
end
