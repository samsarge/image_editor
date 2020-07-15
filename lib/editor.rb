# frozen_string_literal: true

# Main editor service object class to execute the program
class Editor
  # Could have gone for repo pattern here
  # Just going to have editor class store it's
  # own states here to save time for test though
  def initialize
    @commands = [] # Log commands for if we want to add undo
    @image = Image.new
  end

  def call
    loop do
      print 'Execute command: '
      execute_command(gets.chomp.downcase)
    end
  end

  attr_accessor :image

  private

  # Note: all the commands are just 1 letter, followed by arguments. So I = Create with args M & N

  COMMANDS = {
    'i' => Commands::CreateImage,
    'c' => Commands::ClearImage,
    'l' => Commands::ColourPixel,
    'v' => Commands::DrawVerticalSegment,
    'h' => Commands::DrawHorizontalSegment,
    'f' => Commands::FillRegion,
    's' => Commands::ShowContent,
    'x' => Commands::TerminateSession
  }.freeze

  # Could add a rescue here if you wanted better UX, printing out the usable commands and
  # prompting user for an input again.
  def execute_command(user_input)
    input = Input.new(user_input)
    command = COMMANDS[input.command.downcase].new(editor: self, args: input.arguments)
    @commands << command
    command.execute
  end
end
