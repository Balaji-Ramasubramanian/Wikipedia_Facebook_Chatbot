require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'dotenv/load'

# Talk to Facebook
get '/webhook' do
  params['hub.challenge'] if ENV["VERIFY_TOKEN"] == params['hub.verify_token']
end

# Show text in the browser
get "/" do
	erb :home
end

get "/privacypolicy" do
	erb :privacypolicy
end