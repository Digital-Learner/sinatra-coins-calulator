require 'spec_helper'
require 'capybara/rspec'
require_relative 'features/support/has_image'

Capybara.app = Rack::Builder.new do
  map '/' do
    run CoinCalculator::Main
  end
end
