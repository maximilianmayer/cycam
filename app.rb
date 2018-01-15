require 'net/http'
require 'sinatra'
#require 'sinatra/json'
require 'tilt'
require 'tilt/erb'
require 'json'
require 'yaml'

def get_trades ; end

get '/' do
  erb :index
end