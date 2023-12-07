defmodule DayOne do
  @moduledoc """

  """
  @puzzle_input File.read!("lib/day_one/day_one_input.txt")
                |> String.split()

  @spelled_out ~r/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/

  @conversion_map %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }
  def part_one do
    @puzzle_input
    |> Enum.map(fn input ->
      numeric = String.replace(input, ~r/[^\d]/, "")
      first = String.first(numeric)
      last = String.last(numeric)

      String.to_integer("#{first}#{last}")
    end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def part_two do
    @puzzle_input
    |> Enum.map(fn input ->
      matches = Regex.scan(@spelled_out, input)
      filtered = Enum.flat_map(matches, fn [_, x] -> [digify(x)] end)

      first = List.first(filtered)
      last = List.last(filtered)

      String.to_integer("#{first}#{last}")
    end)
    |> IO.inspect()
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def digify(input) do
    # yuck
    try do
      case String.to_integer(input) do
        number -> number
      end
    rescue
      ArgumentError -> @conversion_map[input]
    end
  end
end
