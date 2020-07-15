# frozen_string_literal: true

module Commands
  # X. Terminate the session
  # halt execution of entire program with success status to terminal
  class TerminateSession < Base
    def execute
      exit 0
    end
  end
end
