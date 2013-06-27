require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    get '/' do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.decode(json).sort_by{|station| station["free"]}.reverse
      erb :home
    end
	end
end