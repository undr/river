$LOAD_PATH.unshift File.expand_path("../..", __FILE__)
ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'active_support/all'
require 'oj'
require 'multi_json'
require 'timecop'
require 'river'

RSpec.configure do |config|
  config.mock_with :rspec

  config.around :each, time_freeze: ->(value){ value.is_a?(Date) || value.is_a?(Time) } do |example|
    Timecop.freeze(example.metadata[:time_freeze]){ example.run }
  end
end
