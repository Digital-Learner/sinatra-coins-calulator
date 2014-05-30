require File.join(File.dirname(__FILE__), 'config', 'app.rb')

map '/' do
  run CoinCalculator::Main
end
