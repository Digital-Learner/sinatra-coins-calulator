require 'sinatra/base'

module CoinCalculator
  class Main < Sinatra::Base

    set :static, true
    set :public_dir, './public'

    get '/' do
      erb :index
    end

    post '/calculate' do
      @pennies = params[:pennies]
      erb :result
    end
  end
end
