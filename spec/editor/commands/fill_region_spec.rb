# frozen_string_literal: true

RSpec.describe Commands::FillRegion do
  let(:editor) { Editor.new }
  let(:command) { Commands::FillRegion.new(editor: editor, args: [1, 1, 'D']) }

  before do
    editor.image.pixels = [
      %w[B B B],
      %w[A A B],
      %w[A B B],
      %w[A C C],
      %w[A C B]
    ]
  end

  describe '#execute' do
    it 'should set all pixels in defined region'\
       '(selected by pixel and then continuously adjascent similar pixels)'\
       'to the colour input' do
      expect { command.execute }.to change { editor.image.pixels }.to(
        [
          %w[D D D],
          %w[A A D],
          %w[A D D],
          %w[A C C],
          %w[A C B]
        ]
      )
    end
  end
end
