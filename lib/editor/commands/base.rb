# frozen_string_literal: true

module Commands
  # All commands implement 2 methods, but for now we're just going to do the execute.
  # They should know how to execute and how to undo what they've done.
  # Enforce developers implement these methods by raising exceptions when they don't.
  # Leave out undo for now because test has no need for it.
  class Base
    def initialize(editor:, args:)
      @editor = editor
      @args = args
    end

    def execute
      # MUST be overwritten in all child classes
      raise NoMethodError, "#execute method not yet implemented for #{self.class}"
    end
  end
end
