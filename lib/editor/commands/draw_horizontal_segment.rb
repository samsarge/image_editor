# frozen_string_literal: true

module Commands
  # H X1 X2 Y C. Draw a horizontal segment of colour C in row Y
  # between columns X1 and X2 (inclusive).
  class DrawHorizontalSegment < Base
    def execute
      array = @editor.image.pixels
      x1 = @args[0].to_i
      x2 = @args[1].to_i
      y = @args[2].to_i
      c = @args[3]

      # Note: index == input coord - 1
      # I hate that i'm iterating through every element in the 2d array here...
      # The best thing to do here would be to start at the index you know you need to start at
      # already given the input and just increment indexes from there.
      array.each_with_index do |row, y_index|
        row.each_with_index do |_element, x_index|
          if (x_index >= (x1 - 1)) && (x_index <= (x2 - 1)) && (y_index == (y - 1))
            array[y_index][x_index] = c
          end
        end
      end

      @editor.image.pixels = array
    end
  end
end

# Modify width by changing condition to
# (x_index >= (x1 - 1)) && (x_index <= (x2 - 1)) && (y_index <= (y - 1))
