defmodule DayFive do
  @puzzle_input File.read!("lib/day_five/day_five_input.txt") |> String.split()

  @three_vowels ~r/[aeiou].*[aeiou].*[aeiou]/
  @double_letter ~r/([a-z])\1/
  @naughty_substring ~r/(ab|cd|pq|xy)/
  @two_letters_twice ~r/(..).*\1/
  @letter_sandwich ~r/(.).\1/

  def part_one do
    @puzzle_input
    |> Enum.reduce(0, fn test_string, count ->
      match = &String.match?(test_string, &1)

      if match.(@three_vowels) and
           match.(@double_letter) and
           !match.(@naughty_substring),
         do: count + 1,
         else: count
    end)
  end

  def part_two do
    @puzzle_input
    |> Enum.reduce(0, fn test_string, count ->
      match = &String.match?(test_string, &1)

      if match.(@two_letters_twice) and
           match.(@letter_sandwich),
         do: count + 1,
         else: count
    end)
  end
end
