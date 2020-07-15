# frozen_string_literal: true

# This class will handle storing the pixels and the dimensions of the image in the editor
class Image
  def initialize(x = 0, y = 0)
    @x_dimension = x
    @y_dimension = y
    @pixels = Array.new(@y_dimension) { Array.new(@x_dimension, 'O') }
  end

  attr_reader :x_dimension, :y_dimension
  # Commands will need to alter the pixels on the image
  attr_reader :pixels

  # Be sure to reset the dimensions when changing pixels
  def pixels=(array)
    @pixels = array
    @x_dimension = @pixels.first.length
    @y_dimension = @pixels.length
  end
end
