# frozen_string_literal: true

module Commands
  # C. Clears the table, setting all pixels to white (O).
  class ClearImage < Base
    def execute
      image = @editor.image
      @editor.image = Image.new(image.x_dimension, image.y_dimension)
    end
  end
end
