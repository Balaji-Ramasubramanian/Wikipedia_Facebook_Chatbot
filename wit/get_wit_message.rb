require 'wit'
require_relative '../facebookBot/pages'
class Wit

	#Method to get entities from wit server
	def get_intent(word)

		client = Wit.new(access_token: ENV["WIT_ACCESS_TOKEN"])
		response = client.message(word)

		if response["entities"]["intent"] != nil then
			return response["entities"]["intent"][0]["value"]

		elsif response["entities"]["greetings"] != nil then
			if response["entities"]["GET_PAGE"] != nil then
				if response["entities"]["GET_PAGE"][0]["confidence"] >=  response["entities"]["greetings"][0]["confidence"] then
					return response["entities"]
				else
					return "HI"
				end
			end
			return "HI"

		elsif response["entities"]["GET_PAGE"] != nil then
			return response["entities"]

		else 
			return "INTENT_NOT_FOUND"
		end

	end
end
