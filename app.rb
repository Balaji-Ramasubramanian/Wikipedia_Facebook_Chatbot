require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'dotenv/load'

# Talk to Facebook
get '/webhook' do
  params['hub.challenge'] if ENV["VERIFY_TOKEN"] == params['hub.verify_token']
end

#Show nothing in the browser
get "/" do
  "This is the home page for wikipedia facebook chatbot!"
end
