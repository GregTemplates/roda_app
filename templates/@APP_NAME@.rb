require "roda"
require "dotenv"

Dotenv.load

class <%= app_class_name %> < Roda
  plugin :json
  plugin :assets, css: 'some_file.scss', js: 'some_file.coffee'
  plugin :flash
  plugin :render, engine: "haml"
  plugin :assets
  plugin :multi_route

  use Rack::Session::Cookie, key: "test", secret: ENV["RACK_COOKIE_SECRET"]
 
  Dir['./routes/*.rb'].each{|f| require f}
end
