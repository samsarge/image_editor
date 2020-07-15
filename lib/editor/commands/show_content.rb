# frozen_string_literal: true

module Commands
  # S. Show the contents of the current image
  class ShowContent < Base
    def execute
      @editor.image.pixels.each { |row| puts row.join(' ') }
    end
  end
end
