# frozen_string_literal: true

require_relative './lib/editor/stack'
require_relative './lib/editor/image'
require_relative './lib/editor/input'
require_relative './lib/editor/commands/base'
require_relative './lib/editor/commands/create_image'
require_relative './lib/editor/commands/clear_image'
require_relative './lib/editor/commands/colour_pixel'
require_relative './lib/editor/commands/draw_vertical_segment'
require_relative './lib/editor/commands/draw_horizontal_segment'
require_relative './lib/editor/commands/fill_region'
require_relative './lib/editor/commands/show_content'
require_relative './lib/editor/commands/terminate_session'

require_relative './lib/editor'

Editor.new.call
