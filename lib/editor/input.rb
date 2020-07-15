# frozen_string_literal: true

# Object to take user input and parse into tangible input for command object mapping and arguments
class Input
  def initialize(user_input)
    @user_input = user_input
    parse_user_input!
  end

  def parse_user_input!
    split_input = @user_input.split(' ')
    @command = split_input.shift
    @arguments = split_input
  end

  attr_reader :command, :arguments
end
