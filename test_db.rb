require_relative 'lib/database/base'
require_relative 'lib/database/ledgers'

class Testdb
  ledgers = Cycam::Database::Ledgers.new("#{__dir__}/db")

  puts __dir__

  unless ledgers.key?('key1')
    puts "no key1 for ledgers"
  end

  puts ledgers.key('123')
  ledgers.store('key1', 'val1')
  puts ledgers.key('key1')
end