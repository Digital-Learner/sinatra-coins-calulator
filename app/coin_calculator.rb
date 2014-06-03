require 'sinatra/base'
require 'coin'

module CoinCalculator
  class Main < Sinatra::Base

    set :static, true
    set :public_dir, './public'
    enable :logging

    get '/' do
      erb :index
    end

    post '/calculate' do
      @amount = params[:amount]
      @result = CoinCalculator::Coin.new.return_minimum_coins(@amount)
      erb :result
    end
  end
end
