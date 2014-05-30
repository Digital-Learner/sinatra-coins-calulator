require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Rack::Builder.new do
  map '/' do
    run CoinCalculator::Main
  end
end
