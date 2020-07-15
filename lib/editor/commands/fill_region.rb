# frozen_string_literal: true

module Commands
  # F X Y C. Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R.
  # Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel
  # in R also belongs to this region.

  # Don't use recursion because it has stack overflow problems..
  # Probably going to look up a fill method for this, I imagine someone has done it already.
  # I may have to reimplement after researching best fill method.

  # Update - scan line fill needed

  # This method SHOULD be refactored because it's far too long
  # but it clearly lays out the alogrithm
  class FillRegion < Base
    def execute
      x = @args[0].to_i - 1 # Turn from coord to index
      y = @args[1].to_i - 1
      c = @args[2]

      array = @editor.image.pixels

      old_c = array[y][x]

      return if c == old_c

      stack = Stack.new

      stack.push([x, y])

      max_x = array.first.length
      max_y = array.length

      until stack.empty?
        x, y = stack.pop
        y1 = y

        y1 -= 1 while y1 >= 0 && array[x][y1] == old_c

        y1 += 1

        east = false
        west = false

        while y1 < max_x && array[x][y1] == old_c
          array[x][y1] = c

          if !east && x > 0 && array[x - 1][y1] == old_c
            stack.push([x - 1, y1])
            east = true
          elsif east && x > 0 && array[x - 1][y1] != old_c
            east = false
          end

          if !west && x < max_y - 1 && array[x + 1][y1] == old_c
            stack.push([x + 1, y1])
            west = true
          elsif west && x < max_y - 1 && array[x + 1][y1] != old_c
            west = false
          end
          y1 += 1
        end
      end
    end
  end
end
