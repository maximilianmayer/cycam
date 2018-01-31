require 'moneta'

module Cycam
  class Database
    attr_accessor :backend
    attr_accessor :prune

    def initialize(backend, prunedb = false)
      self.backend = backend
      self.prune = prunedb
    end

    dbstore = Moneta.new(:LevelDB, dir: 'db')

    #if prune
    #  dbstore.clear
    #end

    def store(key,value)
      dbstore.store(key,value)
    end

    def load(key)
      if dbstore.key?(key)
        dbstore.load(key)
      end
    end
  end
end