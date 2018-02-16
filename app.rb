require 'net/http'
require 'sinatra'
require 'tilt'
require 'tilt/erb'
require 'json'
require 'yaml'
#require_relative 'lib/database/database'
#require_relative 'lib/kraken'

module Cycam

  class Webapp < Sinatra::Base

    #backend = Cycam::Database.new('LevelDB', false)

    # derived into own class
    #kraken = Cycam::Kraken.new
    #
    # old way - works
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

    get '/trade/:id/:format?' do
      trade = kraken.private.query_trades(txid: params[:id])
      case params[:format]
        when 'json'
          trade.to_json
        when 'yaml'
          trade.to_yaml
        else
          redirect("/trade/#{params[:id]}")
      end
    end

    get '/trades' do
      erb :trades, locals: { trades: trades }
    end

    get '/ledgers' do
      ledgers = kraken.private.ledgers
      erb :ledgers_list, locals: {ledgers: ledgers['ledger']}
    end

    get '/config' do
      redirect '/'
    end

  end

#  Cycam::Webapp.run
end
