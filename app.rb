require 'net/http'
require 'sinatra'
require 'tilt'
require 'tilt/erb'
require 'json'
require 'yaml'
require 'kraken_client'

module Cycam

  class Webapp < Sinatra::Base

    config_file = './config.yaml'
    app_config = YAML.load_file(config_file)

    KrakenClient.configure do |config|
      config.api_key = app_config['kraken']['api_key']
      config.api_secret = app_config['kraken']['api_secret']
    end

    kraken = KrakenClient.load
    trades = kraken.private.trades_history['trades']

    get '/' do
      bal = kraken.private.balance
      erb :index, locals: {balance: bal}
    end

    get '/trade/:id'do
      trade = kraken.private.query_trades(txid: params[:id])
      erb :trade, locals:  {data: trade}
    end


    get '/trades' do
      erb :trades, locals: { trades: trades }
    end

    get '/config' do
      redirect '/'
    end

  end

#  Cycam::Webapp.run
end
