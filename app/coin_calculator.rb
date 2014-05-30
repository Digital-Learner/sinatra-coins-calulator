require 'sinatra/base'

module CoinCalculator
  class Main < Sinatra::Base
    get '/' do
      erb :index
    end
  end
end
