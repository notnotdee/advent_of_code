defmodule DayFour do
  @moduledoc """
  iex(1)  > :crypto.hash(:md5, "abcdef609043") |> Base.encode16()
          > "000001DBBFA3A5C83A2D506429C7B00E"
  """

  @puzzle_input File.read!("lib/day_four/day_four_input.txt") |> String.trim()
  @limit 10_000_000
  @five_zeroes ~r/^0{5}/
  @six_zeroes ~r/^0{6}/

  def md5_hash(string), do: :crypto.hash(:md5, string) |> Base.encode16()

  def miner(regex) do
    1..@limit
    |> Stream.map(fn number ->
      test_input = @puzzle_input <> "#{number}"

      test_hash = test_input |> md5_hash()

      if String.match?(test_hash, regex) do
        number
      else
        nil
      end
    end)
    |> Stream.drop_while(&(&1 == nil))
    |> Enum.take(1)
  end

  def part_one, do: @five_zeroes |> miner()
  def part_two, do: @six_zeroes |> miner()
end
