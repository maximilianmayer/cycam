require 'net/http'
require 'sinatra'
require 'tilt'
require 'tilt/erb'
require 'json'
require 'yaml'
require 'kraken_client'

module Cycam

  class Webapp < Sinatra::Base
    KrakenClient.configure do |config|
      config.api_key = '5zqVAsOdHiZK5sV7WPdRX4si4z/CRSSO6FgKhpeIu9/pVfkKQz1oX1FE'
      config.api_secret = 'U0SzR3KAmEUAUcgHxWQMPmYMwlsLktD7F9zBRt8D393qch9WZV5jalkklu48j0QWtdbBLE5t9apxVfyo0G7KDg=='
    end

    kraken = KrakenClient.load
    #def get_trades ; end

    get '/' do
      erb :index
    end

    get '/trades' do
      trades = kraken.private.trades_history['trades']
      erb :trades, locals: { trades: trades }
    end
  end

end