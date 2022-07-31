defmodule DaySix do
  @puzzle_input File.read!("lib/day_six/day_six_input.txt")
                |> String.split("\n", trim: true)
                |> Enum.take(1)

  def parse_input do
    @puzzle_input
    |> Enum.map(&String.split/1)
    |> Enum.map(&format_input/1)
  end

  def format_input([_, "on", lo, _, hi]), do: to_format(:turn_on, lo, hi)
  def format_input([_, "off", lo, _, hi]), do: to_format(:turn_off, lo, hi)
  def format_input(["toggle", lo, _, hi]), do: to_format(:toggle, lo, hi)

  def to_format(instruction, lo, hi) do
    [x1, y1] = lo |> String.split(",") |> Enum.map(&String.to_integer/1)
    [x2, y2] = hi |> String.split(",") |> Enum.map(&String.to_integer/1)

    {instruction, {x1, y1}, {x2, y2}}
  end
end
