require 'berkshelf'
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.color_enabled = true
  config.tty = true
end
