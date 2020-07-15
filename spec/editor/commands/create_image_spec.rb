# frozen_string_literal: true

RSpec.describe Commands::CreateImage do
  let(:editor) { Editor.new }
  let(:command) { Commands::CreateImage.new(editor: editor, args: [5, 5]) }

  describe '#execute' do
    it 'should set the pixels in the editors image to match the input' do
      expect { command.execute }.to change { editor.image.pixels }.to(
        Array.new(5) { Array.new(5, 'O') }
      )
    end
  end
end
