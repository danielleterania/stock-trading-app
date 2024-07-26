# spec/rails_helper.rb

# Add this line at the beginning of the file to ensure Rails environment is loaded
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

RSpec.configure do |config|
  # ... other configurations

  # Use the new syntax for `expect` and `allow`
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configure the render views option to enable view rendering for controller tests
  config.render_views
end
