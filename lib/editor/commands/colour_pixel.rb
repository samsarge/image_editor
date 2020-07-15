# frozen_string_literal: true

module Commands
  # L X Y C. Colours the pixel (X,Y) with colour C.
  class ColourPixel < Base
    def execute
      x = @args[0].to_i - 1 # From coords to index
      y = @args[1].to_i - 1
      c = @args[2]

      @editor.image.pixels[y][x] = c
    end
  end
end
