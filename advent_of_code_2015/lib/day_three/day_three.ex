defmodule DayThree do
  @moduledoc """
  Create an {x, y} coordinate map using tuples.

  Each character indicates how to traverse the map:
  ^ = {x, y + 1}
  > = {x + 1, y}
  v = {x, y - 1}
  < = {x - 1, y}

  When a new coordinate is visited, add this coordinate to a set (MapSet).

  To determine how many houses have received at least one present (been visited at least once), return the length of the set.
  """

  @puzzle_input File.read!("lib/day_three/day_three_input.txt") |> String.codepoints()

  @santa @puzzle_input |> Enum.take_every(2)
  @robo_santa @puzzle_input |> Enum.drop(1) |> Enum.take_every(2)

  @char_to_coordinate %{
    "^" => %{x: 0, y: 1},
    ">" => %{x: 1, y: 0},
    "v" => %{x: 0, y: -1},
    "<" => %{x: -1, y: 0}
  }

  @starting_position %{x: 0, y: 0}
  @uniques MapSet.new() |> MapSet.put(@starting_position)

  def traverse_map(input) do
    %{uniques: uniques} =
      input
      |> Enum.reduce(%{position: @starting_position, uniques: @uniques}, fn char, acc ->
        coordinate_pair = @char_to_coordinate[char]

        new_position = %{
          x: acc.position.x + coordinate_pair.x,
          y: acc.position.y + coordinate_pair.y
        }

        uniques = acc.uniques |> MapSet.put(new_position)

        %{
          position: new_position,
          uniques: uniques
        }
      end)

    uniques
  end

  def part_one do
    @puzzle_input
    |> traverse_map()
    |> MapSet.size()
  end

  def part_two do
    santa = traverse_map(@santa)
    robo_santa = traverse_map(@robo_santa)

    uniques = MapSet.union(santa, robo_santa)

    uniques |> MapSet.size()
  end
end
