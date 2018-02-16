require 'moneta'

module Cycam
  module Database
    class Ledgers < Base

      def initialize(dir)
        @type = 'ledgers'
        @db = Moneta.new(:LevelDB, dir: "#{dir}/#{@type}")
      end

    end
  end
end