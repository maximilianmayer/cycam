require 'moneta'

module Cycam
  module Database
    class Base

      def store(key,val)
        @db.store(key,val)
      end

      def key?(key)
        if @db.key?(key)
          true
        else
          false
        end
      end

      def key(key)
        if key?(key)
          @db.load(key)
        else
          false
        end
      end

    end
  end
end