defmodule DayOne do
  @puzzle_input File.read!("lib/day_one/day_one_input.txt")
                |> String.split("\n\n")
                |> Enum.map(fn elf ->
                  elf
                  |> String.split("\n")
                  |> Enum.reduce(0, fn input, acc -> String.to_integer(input) + acc end)
                end)

  def part_one,
    do:
      @puzzle_input
      |> Enum.max()

  def part_two,
    do:
      @puzzle_input
      |> Enum.sort(:desc)
      |> Enum.slice(0, 3)
      |> Enum.reduce(fn input, acc -> input + acc end)
end
