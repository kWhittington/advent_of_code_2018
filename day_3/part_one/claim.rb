# frozen_string_literal: true

# A rectangular patch of claimed cloth from a larger square fabric.
# The claim is placed on the larger square relative to the top-left corner.
class Claim
  Point = Struct.new(:x, :y)

  REGEXP = %r{^\#(?<id>\d+)\s\@\s(?<x>\d+),(?<y>\d+)\:
              \s(?<width>\d+)x(?<height>\d+)$}x.freeze

  # @param string [String]
  #  an encoded string representing a Claim instance
  # @return [Claim]
  #  a newly instantiated Claim with the decoded attributes
  def self.from_string(string)
    match = REGEXP.match(string)
    new(id: match[:id].to_i, height: match[:height].to_i,
      width: match[:width].to_i, x: match[:x].to_i, y: match[:y].to_i)
  end

  # @return [String]
  #  an identifier for this claim
  attr_reader :id

  # @return [Integer]
  #  how far down the claim extends
  attr_reader :height

  # @return [Integer]
  #  how far right the claim extends
  attr_reader :width

  # @return [Integer]
  #  the horizontal location of the claim's top-left corner (left-to-right)
  attr_reader :x

  # @return [Integer]
  #  the vertical location of the claim's top-left corner (top-down)
  attr_reader :y

  # @param id [String]
  #  an identifier to tell this claim apart from others
  # @param height [Integer]
  #  how far down the claim extends
  # @param width [Integer]
  #  how far right the claim extends
  # @param x [Integer]
  #  the horizontal location of the claim's top-left corner (left-to-right)
  # @param y [Integer]
  #  the vertical location of the claim's top-left corner (top-down)
  def initialize(id:, height:, width:, x:, y:)
    @id = id
    @height = height.to_i
    @width = width.to_i
    @x = x.to_i
    @y = y.to_i
  end

  # @return [Integer]
  #  the bottom-most value of the claim
  def bottom
    y + height
  end

  # @return [Integer]
  #  the left-most value of the claim
  def left
    x
  end

  # @return [Integer]
  #  the right-most value of the claim
  def right
    x + width
  end

  # @return [String]
  def to_s
    "\##{id} @ #{x},#{y}: #{width}x#{height}"
  end

  # @return [Integer]
  #  the top-most value of the claim
  def top
    y
  end
end
