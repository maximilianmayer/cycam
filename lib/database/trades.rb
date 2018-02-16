require 'moneta'

module Cycam
  module Database
    class Trades < Base

      def initialize(dir)
        @type = 'trades'
        @db = Moneta.new(:LevelDB, dir: "#{dir}/#{@type}")
      end

    end
  end
end