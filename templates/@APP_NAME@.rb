require "dotenv"
require "roda"
require "rack/csrf"

require "./models"

Dotenv.load

class <%= app_class_name %> < Roda
  use Rack::Session::Cookie, key: ENV["RACK_COOKIE_KEY"], secret: ENV["RACK_COOKIE_SECRET"]
  plugin :environments
  self.environment = ENV["ENVIRONMENT"]

  plugin :csrf, raise: true
  plugin :assets, css: 'some_file.scss', js: 'some_file.coffee'
  plugin :flash
  plugin :render, engine: "haml"
  plugin :assets
  plugin :multi_route


  require "./assets/assets"

  require "./routes/main.rb"
  Dir['./routes/*.rb'].each{|f| require f}
end
