# frozen_string_literal: true

RSpec.describe Commands::TerminateSession do
  let(:editor) { Editor.new }
  let(:command) { Commands::TerminateSession.new(editor: editor, args: [1, 1, 'D']) }

  describe '#execute' do
    it 'should output the image to the console' do
      expect { command.execute }.to(raise_error { SystemExit })
    end
  end
end
