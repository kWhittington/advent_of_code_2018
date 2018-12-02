# frozen_string_literal: true
require 'pathname'

# Late at night, you sneak to the warehouse - who knows what kinds of paradoxes
# you could cause if you were discovered - and use your fancy wrist device to
# quickly scan every box and produce a list of the likely candidates (your
# puzzle input).
#
# To make sure you didn't miss any, you scan the likely candidate boxes again,
# counting the number that have an ID containing exactly two of any letter and
# then separately counting those with exactly three of any letter. You can
# multiply those two counts together to get a rudimentary checksum and compare
# it to what your device predicts.
#
# For example, if you see the following box IDs:
#
# abcdef contains no letters that appear exactly two or three times.
# bababc contains two a and three b, so it counts for both.
# abbcde contains two b, but no letter appears exactly three times.
# abcccd contains three c, but no letter appears exactly two times.
# aabcdd contains two a and two d, but it only counts once.
# abcdee contains two e.
# ababab contains three a and three b, but it only counts once.
# Of these box IDs, four of them contain a letter which appears exactly twice,
# and three of them contain a letter which appears exactly three times.
# Multiplying these together produces a checksum of 4 * 3 = 12.
#
# What is the checksum for your list of box IDs?
part_one_pathname = Pathname.new(File.expand_path(__FILE__)).parent
input_pathname = part_one_pathname.join('input.txt')
two_like_letter_id_count = 0
three_like_letter_id_count =  0

input_pathname.each_line do |line|
  if line.chars.any? { |char| line.chars.count(char) == 2 }
    two_like_letter_id_count += 1
  end
  if line.chars.any? { |char| line.chars.count(char) == 3 }
    three_like_letter_id_count += 1
  end
end

checksum = two_like_letter_id_count * three_like_letter_id_count

puts "#{two_like_letter_id_count} ids with exactly two matching letters."
puts "#{three_like_letter_id_count} ids with exactly three matching letters."
puts "Checksum of box list: #{checksum}"
# With the current input, outputs:
# 247 ids with exactly two matching letters.
# 19 ids with exactly three matching letters.
# Checksum of box list: 4693
#
# Answer: 4693
