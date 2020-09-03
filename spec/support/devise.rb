# frozen_string_literal: true

require_relative './controller_macros' # or require_relative './controller_macros' if write in `spec/support/devise.rb`

RSpec.configure do |config|
  # For Devise > 4.1.1
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.extend ControllerMacros, type: :controller

  config.include Warden::Test::Helpers
end
