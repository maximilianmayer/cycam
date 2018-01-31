require 'kraken_client'
require_relative 'db'

module Cycam
  class Kraken

    config_file = './config.yaml'
    @app_config = YAML.load_file(config_file)

    KrakenClient.configure do |config|
      config.api_key = @app_config['kraken']['api_key']
      config.api_secret = @app_config['kraken']['api_secret']
    end

    @client = KrakenClient.load

    def trades
      @client.private.trades_history['trades']
    end

    def balance
      @client.private.balance
    end
  end

end