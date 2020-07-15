# frozen_string_literal: true

RSpec.describe Commands::ColourPixel do
  let(:editor) { Editor.new }
  let(:command) { Commands::ColourPixel.new(editor: editor, args: [1, 1, 'A']) }

  before { editor.image.pixels = [%w[C C C]] }

  describe '#execute' do
    it 'should change the specified pixel (X,Y) to the input letter / colour' do
      expect { command.execute }.to change { editor.image.pixels }.to([%w[A C C]])
    end
  end
end
