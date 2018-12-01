# frozen_string_literal: true
require 'pathname'

# After feeling like you've been falling for a few minutes, you look at the
# device's tiny screen. "Error: Device must be calibrated before first use.
# Frequency drift detected. Cannot maintain destination lock." Below the
# message, the device shows a sequence of changes in frequency (your puzzle
# input). A value like +6 means the current frequency increases by 6; a value
# like -3 means the current frequency decreases by 3.
#
# For example, if the device displays frequency changes of +1, -2, +3, +1, then
# starting from a frequency of zero, the following changes would occur:
#
# Current frequency  0, change of +1; resulting frequency  1.
# Current frequency  1, change of -2; resulting frequency -1.
# Current frequency -1, change of +3; resulting frequency  2.
# Current frequency  2, change of +1; resulting frequency  3.
# In this example, the resulting frequency is 3.
#
# Here are other example situations:
#
# +1, +1, +1 results in  3
# +1, +1, -2 results in  0
# -1, -2, -3 results in -6
# Starting with a frequency of zero, what is the resulting frequency after all
# of the changes in frequency have been applied?
part_one_pathname = Pathname.new(File.expand_path(__FILE__)).parent
input_pathname = part_one_pathname.join('input.txt')
frequency = 0

input_pathname.each_line do |line|
  /^(?<operator>[-+])(?<operand>\d+)$/.match(line) do |match|
    operand = match[:operand].to_i
    operator = match[:operator]
    result = frequency.public_send(operator, operand)
    puts "Current frequency #{frequency}, change of #{operator}#{operand}; "\
         "resulting frequency #{result}."
    frequency = result
  end
end
# With the current input, outputs:
# Current frequency -124708, change of +125143; resulting frequency 435.
# as the final line
#
# Answer: 435
