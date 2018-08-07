require 'wit'
require_relative '../facebookBot/pages'

# @author Balaji
class Wit

	# @param phrase [String] The sentence which has to be processed by Wit.ai.
	# @return [String] It denotes the entity values from the sentence processed by Wit.
	# Method to get entities from wit server
	#
	def get_intent(phrase)

		client = Wit.new(access_token: ENV["WIT_ACCESS_TOKEN"])
		response = client.message(phrase)

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
