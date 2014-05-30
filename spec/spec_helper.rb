require 'pry'
require 'simplecov'

SimpleCov.start

ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'config', 'app.rb')

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.around(:each, :fullstack => true) do |example|
    example.run
  end
end
