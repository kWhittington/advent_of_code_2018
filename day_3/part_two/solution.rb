# frozen_string_literal: true
require 'pathname'
require './day_3/part_two/claim'

# Amidst the chaos, you notice that exactly one claim doesn't overlap by even
# a single square inch of fabric with any other claim. If you can somehow
# draw attention to it, maybe the Elves will be able to make Santa's suit
# after all!
#
# For example, in the claims above, only claim 3 is intact after all claims
# are made.
#
# What is the ID of the only claim that doesn't overlap?
part_two_pathname = Pathname.new(File.expand_path(__FILE__)).parent
input_pathname = part_two_pathname.join('input.txt')

claims = input_pathname.readlines.map { |line| Claim.from_string(line.chomp) }
# non_overlapping_claim = claims.find do |claim|
#   claims.none? { |other| claim.overlap?(other) }
# end
non_overlapping_claims = claims.select do |claim|
  (claims - [claim]).none? { |other| claim.overlap?(other) }
end

puts "Claim #{non_overlapping_claims.map(&:id)} doesn't overlap."
# Outputs:
# Claim [297] doesn't overlap.
#
# Answer: 297
