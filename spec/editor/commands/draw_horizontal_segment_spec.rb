# frozen_string_literal: true

RSpec.describe Commands::DrawHorizontalSegment do
  let(:editor) { Editor.new }
  let(:command) { Commands::DrawHorizontalSegment.new(editor: editor, args: [1, 3, 2, 'C']) }

  before do
    editor.image.pixels = [
      %w[A A A],
      %w[A A A],
      %w[A A A]
    ]
  end

  describe '#execute' do
    it 'should set all pixels in the defined X1 X2 range on the'\
       'Y axis defined to the chosen colour / letter' do
      expect { command.execute }.to change { editor.image.pixels }.to(
        [
          %w[A A A],
          %w[C C C],
          %w[A A A]
        ]
      )
    end
  end
end
