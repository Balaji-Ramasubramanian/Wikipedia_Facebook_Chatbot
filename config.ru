require_relative './app'
require 'facebook/messenger'
require_relative 'facebookBot/bot'
require 'rake'

# run regular sinatra for other paths (in case you ever need it)
run Sinatra::Application

# run both Sinatra and facebook-messenger on /webhook
map("/webhook") do
  run Facebook::Messenger::Server
end

# Show home page text in the browser
get "/" do
	erb :home
end

# Show the privacy policy of the bot
get "/privacypolicy" do
	erb :privacypolicy
end