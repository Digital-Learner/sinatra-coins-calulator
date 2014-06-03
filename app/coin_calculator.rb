require 'sinatra/base'
require 'sinatra/assetpack'
require 'coin'
require 'sinatra/flash'

module CoinCalculator
  class Main < Sinatra::Base

    register Sinatra::AssetPack
    register Sinatra::Flash

    assets do
      serve '/js', from: 'assets/js'
      serve '/bower_components', from: 'bower_components'

      js :modernizr, [
        '/bower_components/modernizr/modernizr.js',
      ]

      js :libs, [
        '/bower_components/jquery/dist/jquery.js',
        '/bower_components/foundation/js/foundation.js'
      ]

      js :application, [
        '/js/app.js'
      ]

      js_compression :jsmin
    end

    set :static, true
    set :public_dir, './public'
    enable :logging
    enable :sessions

    get '/' do
      erb :index
    end

    post '/calculate' do
      @amount = params[:amount]
      @result = CoinCalculator::Coin.new.return_minimum_coins(@amount)

      unless @result.empty?
        erb :result
      else
        flash[:error] = "You must enter an amount"
        redirect to('/')
      end
    end
  end
end
