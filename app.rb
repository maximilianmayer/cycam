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
      config.api_key = 'xxx'
      config.api_secret = 'xxx'
    end

    kraken = KrakenClient.load
    trades = kraken.private.trades_history['trades']

    get '/' do
      erb :index
    end

    get '/trades' do
      erb :trades, locals: { trades: trades }
    end
  end

end
