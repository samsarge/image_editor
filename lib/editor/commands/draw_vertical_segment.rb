# frozen_string_literal: true

module Commands
  # V X Y1 Y2 C. Draw a vertical segment of colour C
  # in column X between rows Y1 and Y2 (inclusive).
  class DrawVerticalSegment < Base
    def execute
      array = @editor.image.pixels
      x = @args[0].to_i
      y1 = @args[1].to_i
      y2 = @args[2].to_i
      c = @args[3]

      # Note: index == input coord - 1
      # Same as the horizontal one, I hate that I'm iterating over every element here
      array.each_with_index do |row, y_index|
        row.each_with_index do |_element, x_index|
          if (y_index >= (y1 - 1)) && (y_index <= (y2 - 1)) && (x_index == (x - 1))
            array[y_index][x_index] = c
          end
        end
      end

      @editor.image.pixels = array
    end
  end
end
