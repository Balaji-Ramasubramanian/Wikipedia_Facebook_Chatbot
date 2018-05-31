require 'wit'
require_relative '../facebookBot/pages'
class Wit

	#Method to get entities from wit server
	def get_intent(word)
		
		client = Wit.new(access_token: ENV["WIT_ACCESS_TOKEN"])
		response = client.message(word)

		if response["entities"]["intent"] != nil then
			return response["entities"]["intent"][0]["value"]

		elsif response["entities"]["GET_PAGE"] != nil then
			return response["entities"]

		elsif response["entities"]["greetings"] != nil then
			return "HI"	
			
		else 
			return "NOTHING"
		end

	end
end
