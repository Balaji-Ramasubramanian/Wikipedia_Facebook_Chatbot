require 'facebook/messenger'

require_relative '../utils.rb'
require_relative './featured_article'
require_relative './pages'
require_relative '../wit/get_wit_message'
require_relative 'json_templates/greeting'
require_relative 'json_templates/persistent_menu'
require_relative 'json_templates/get_started'
require_relative 'json_templates/template'
require_relative 'json_templates/quick_replies'
require_relative 'strings'


include Facebook::Messenger

class MessengerBot

	# Method to get user Facebook profile details
	def self.get_profile(id)
 		fb_profile_url = FB_PROFILE + id + FB_PROFILE_FIELDS
 		profile_details = HTTParty.get(fb_profile_url)
 		@first_name = profile_details["first_name"]
 		@last_name = profile_details["last_name"]
 		@profile_pic = profile_details["profile_pic"]
 		@locale = profile_details["locale"]
 		@gender = profile_details["gender"]
 		return profile_details
 	end

 	# Method to push a message to Facebook
	def self.say(recipient_id, text)
		message_options = {
			messaging_type: "RESPONSE",
			recipient: { id: recipient_id },
			message: { text: text }
		}
		HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options)
	end

	# To send a quick reply to user
	def self.send_quick_reply(id)
		message_options = {
			messaging_type: "RESPONSE",
			recipient: { id: id},
			message: {
				text: QUICK_REPLY_HEADER["#{@language}"],
				quick_replies: QUICK_REPLIES["#{@language}"] 
			}
		}
	 	response = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options.to_json)
	 end

	# Typing indication:
	def self.typing_on(id)
		message_options = {
			messaging_type: "RESPONSE",
			recipient: { id: id },
			sender_action: "typing_on",
		}
		response = HTTParty.post(FB_MESSAGE,headers: HEADER, body: message_options.to_json)		
  	end


	# Method that handles messages
	def self.handle_message(id,message)
		get_profile(id)
		@language = @locale[0,2]
		WikipediaRestClient.set_language(@language)
		message = message.downcase
		case message
		when MOST_READ_MESSAGE["#{@language}"].downcase
			handle_postback(id,"MOST_READ")
		when RANDOM_ARTICLE_MESSAGE["#{@language}"].downcase
			handle_postback(id,"RANDOM_ARTICLE")
		when FEATURED_ARTICLE_MESSAGE["#{@language}"].downcase
			handle_postback(id, "FEATURED_ARTICLE")
		when IMAGE_OF_THE_DAY_MESSAGE["#{@language}"].downcase
			handle_postback(id, "IMAGE_OF_THE_DAY")
		when ON_THIS_DAY_MESSAGE["#{@language}"].downcase
			handle_postback(id,"ON_THIS_DAY")
		else
			handle_wit_response(id,message)
		end
	end

	# Uses Wit.ai to find the intent of the message
	def self.handle_wit_response(id,message)
		wit_response = Wit.new.get_intent(message)
		if wit_response.class == String then
			handle_postback(id,wit_response)
		elsif wit_response["GET_PAGE"] != nil then
			page_name = wit_response["GET_PAGE"][0]["value"]
			get_page(id,page_name)
		else
			get_page(id,message)
		end
	end

	# Method that handles postbacks
	def self.handle_postback(id,postback_payload)
		typing_on(id)
		get_profile(id)
		@language = @locale[0,2]
		WikipediaRestClient.set_language(@language)
		case postback_payload
		when "GET_STARTED"
			get_profile(id)
			greeting_message = GREETING_MESSAGE["#{@language}"]
			say(id,greeting_message)
			send_quick_reply(id)
		when "RANDOM_ARTICLE"
			get_random(id)
		when "FEATURED_ARTICLE"
			get_today_featured_article(id)
		when "IMAGE_OF_THE_DAY"
			get_image_of_the_day(id)
		when "MOST_READ"
			get_most_read(id)
		when "ON_THIS_DAY"
			get_on_this_day(id)
		when "HELP"
			send_quick_reply(id)
		when "HI"
			say(id,GREETING_MESSAGE["#{@language}"])
			send_quick_reply(id)
		else
			handle_get_summary_postbacks(id,postback_payload)
		end
	end


	# Initial configuration for the bot 
	Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["FB_ACCESS_TOKEN"])
	greeting_response 		 =HTTParty.post(FB_PAGE,  headers: HEADER, body: GREETING.to_json )
	get_started_response	 =HTTParty.post(FB_PAGE,  headers: HEADER, body: GET_STARTED.to_json)
	persistent_menu_response =HTTParty.post(FB_PAGE, headers: HEADER, body: PERSISTENT_MENU.to_json)


	# Triggers whenever a message has got
	Bot.on :message do |message|
		id = message.sender["id"]
		typing_on(id)
		handle_message(id,message.text)
	end

	# Triggers whenever a postback happens
	Bot.on :postback do |postback|
		id = postback.sender["id"]
		handle_postback(id,postback.payload)
	end

end