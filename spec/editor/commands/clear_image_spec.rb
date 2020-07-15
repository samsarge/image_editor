# frozen_string_literal: true

RSpec.describe Commands::ClearImage do
  let(:editor) { Editor.new }
  let(:command) { Commands::ClearImage.new(editor: editor, args: []) }

  before { editor.image.pixels = [%w[C C C]] }

  describe '#execute' do
    it 'should set all existing pixels to \'O\'' do
      expect { command.execute }.to change { editor.image.pixels }.to([%w[O O O]])
    end
  end
end
