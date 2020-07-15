# frozen_string_literal: true

module Commands
  # I M N. Create a new M x N image with all pixels coloured white (O).
  class CreateImage < Base
    def execute
      @args.map!(&:to_i)
      @editor.image = Image.new(*@args)
    end
  end
end
