defmodule DayTwo do
  @moduledoc """
  For example:
  A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
  """
  @puzzle_input File.read!("lib/day_two/day_two_input.txt") |> String.split()
  @parsed_input @puzzle_input
                |> Enum.map(fn input ->
                  split_string = input |> String.split("x")
                  for lwh <- split_string, do: lwh |> String.to_integer()
                end)

  def calculate_surface_area(l, w, h), do: 2 * l * w + 2 * w * h + 2 * l * h

  def calculate_ribbon_length(l, w, h), do: l * w * h

  def calculate_smallest_sides(l, w, h) do
    [s1, s2 | _rest] = Enum.sort([l, w, h], :asc)
    {s1, s2}
  end

  def total_wrapping_paper(l, w, h) do
    surface_area = calculate_surface_area(l, w, h)
    {s1, s2} = calculate_smallest_sides(l, w, h)

    surface_area + s1 * s2
  end

  def total_ribbon(l, w, h) do
    ribbon_to_wrap = calculate_ribbon_length(l, w, h)
    {s1, s2} = calculate_smallest_sides(l, w, h)

    ribbon_to_wrap + s1 + s1 + s2 + s2
  end

  def part_one,
    do:
      @parsed_input
      |> Enum.reduce(0, fn [l, w, h], acc ->
        acc + total_wrapping_paper(l, w, h)
      end)

  def part_two,
    do:
      @parsed_input
      |> Enum.reduce(0, fn [l, w, h], acc ->
        acc + total_ribbon(l, w, h)
      end)
end
