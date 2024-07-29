# spec/rails_helper.rb

# Add this line at the beginning of the file to ensure Rails environment is loaded
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'
require './spec/support/factory_bot'
require 'devise' # Ensure Devise is required if you are using it

# Add additional requires below this line. Rails is not loaded until this point!
# ...

# Configure RSpec
RSpec.configure do |config|
  # Include Devise test helpers for request specs
  config.include Devise::Test::IntegrationHelpers, type: :request

  # Use the new syntax for `expect` and `allow`
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configure the render views option to enable view rendering for controller tests
  config.render_views

  # Add more configuration options as needed
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :system
  config.include Warden::Test::Helpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Devise::Test::IntegrationHelpers, type: :request
end
