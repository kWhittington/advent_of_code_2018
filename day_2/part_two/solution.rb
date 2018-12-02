# frozen_string_literal: true
require 'pathname'

# Confident that your list of box IDs is complete, you're ready to find the
# boxes full of prototype fabric.
#
# The boxes will have IDs which differ by exactly one character at the same
# position in both strings. For example, given the following box IDs:
#
# abcde
# fghij
# klmno
# pqrst
# fguij
# axcye
# wvxyz
# The IDs abcde and axcye are close, but they differ by two characters (the
# second and fourth). However, the IDs fghij and fguij differ by exactly one
# character, the third (h and u). Those must be the correct boxes.
#
# What letters are common between the two correct box IDs? (In the example
# above, this is found by removing the differing character from either ID,
# producing fgij.)
part_one_pathname = Pathname.new(File.expand_path(__FILE__)).parent
input_pathname = part_one_pathname.join('input.txt')
lines = input_pathname.readlines
# lines = %w(
#   abcde
#   fghij
#   klmno
#   pqrst
#   fguij
#   axcye
#   wvxyz
# )

lines.any? do |first_id|
  first_id = first_id.chomp
  first_chars = first_id.chars
  lines.any? do |second_id|
    second_id = second_id.chomp
    second_chars = second_id.chars
    first_indexes = first_chars.map.with_index { |char, index| [char, index] }
    second_indexes = second_chars.map.with_index { |char, index| [char, index] }
    first_diff = first_indexes.select do |(char, index)|
      second_chars[index] != char
    end
    second_diff = second_indexes.select do |(char, index)|
      first_chars[index] != char
    end
    next unless first_diff.length == 1
    next unless second_diff.length == 1
    next unless first_diff.first.last == second_diff.first.last
    intersecting_chars = first_chars.reject.with_index do |_, index|
      index == first_diff.first.last
    end
    puts "#{first_id} and #{second_id} share #{intersecting_chars.join}"
    true
  end
end
# With the current input, outputs:
# pnebjqsalrdnckzfihvtxysomg and prebjqsalrdnckzfihvtxysomg share
# pebjqsalrdnckzfihvtxysomg
#
# Answer: pebjqsalrdnckzfihvtxysomg
