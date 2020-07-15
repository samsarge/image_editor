# frozen_string_literal: true

RSpec.describe Commands::ShowContent do
  let(:editor) { Editor.new }
  let(:command) { Commands::ShowContent.new(editor: editor, args: [1, 1, 'D']) }

  before do
    editor.image.pixels = [%w[B B B]]
  end

  describe '#execute' do
    it 'should output the image to the console' do
      expect { command.execute }.to output("B B B\n").to_stdout
    end
  end
end
