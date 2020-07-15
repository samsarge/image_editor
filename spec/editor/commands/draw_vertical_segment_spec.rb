# frozen_string_literal: true

RSpec.describe Commands::DrawVerticalSegment do
  let(:editor) { Editor.new }
  let(:command) { Commands::DrawVerticalSegment.new(editor: editor, args: [2, 1, 3, 'C']) }

  before do
    editor.image.pixels = [
      %w[A A A],
      %w[A A A],
      %w[A A A]
    ]
  end

  describe '#execute' do
    it 'should set all pixels in the defined Y1 Y2 range on the'\
       'X axis defined to the chosen colour / letter' do
      expect { command.execute }.to change { editor.image.pixels }.to(
        [
          %w[A C A],
          %w[A C A],
          %w[A C A]
        ]
      )
    end
  end
end
