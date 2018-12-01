# frozen_string_literal: true
require 'pathname'

# You notice that the device repeats the same frequency change list over and
# over. To calibrate the device, you need to find the first frequency it
# reaches twice.
#
# For example, using the same list of changes above, the device would loop as
# follows:
#
# Current frequency  0, change of +1; resulting frequency  1.
# Current frequency  1, change of -2; resulting frequency -1.
# Current frequency -1, change of +3; resulting frequency  2.
# Current frequency  2, change of +1; resulting frequency  3.
# (At this point, the device continues from the start of the list.)
# Current frequency  3, change of +1; resulting frequency  4.
# Current frequency  4, change of -2; resulting frequency  2, which has already
# been seen.
# In this example, the first frequency reached twice is 2. Note that your
# device might need to repeat its list of frequency changes many times before a
# duplicate frequency is found, and that duplicates might be found while in the
# middle of processing the list.
#
# Here are other examples:
#
# +1, -1 first reaches 0 twice.
# +3, +3, +4, -2, -4 first reaches 10 twice.
# -6, +3, +8, +5, -6 first reaches 5 twice.
# +7, +7, -2, -7, -4 first reaches 14 twice.
# What is the first frequency your device reaches twice?
part_two_pathname = Pathname.new(File.expand_path(__FILE__)).parent
input_file = part_two_pathname.join('input.txt').open
frequency = 0
frequency_heat_map = Hash.new(0)
frequency_heat_map[frequency] += 1

until frequency_heat_map[frequency] >= 2
  input_file.rewind if input_file.eof?
  line = input_file.readline
  /^(?<operator>[-+])(?<operand>\d+)$/.match(line) do |match|
    operand = match[:operand].to_i
    operator = match[:operator]
    result = frequency.public_send(operator, operand)
    puts "Current frequency #{frequency}, change of #{operator}#{operand}; "\
         "resulting frequency #{result}."
    frequency = result
    frequency_heat_map[frequency] += 1
  end
end

puts "Frequency #{frequency} reached for the 2nd time."
# With the current input, outputs:
# Frequency 245 reached for the 2nd time.
# as the final line
#
# Answer: 245
