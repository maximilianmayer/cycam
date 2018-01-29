require 'moneta'

module Cycam
  class Database

    def initialize(backend, prunedb=false)
      @backend = backend
      @prune = prunedb
    end

    dbstore = Moneta.new(:LevelDB, dir: 'db')
    if @prune
      dbstore.clear
    end

    def store(key,value)
      dbstore.store(key,value)
    end

      dbstore.delete('key1')
    def load(key)
      if dbstore.key?(key)
        dbstore.load(key)
      end
    end
  end
end