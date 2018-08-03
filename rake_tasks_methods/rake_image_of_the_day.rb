require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

class RakeTaskClass 

	def send_image_of_the_day(language)
		subscribed_users = User.select("facebook_userid").where("locale like ? AND image_of_the_day_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_image_of_the_day("#{language}")
			subscribed_users.each do |users|
				MessengerBot.say(users.facebook_userid,MessengerBot::CHECKOUT_IMAGE_OF_THE_DAY["#{language}"])
				MessengerBot.post_template(users.facebook_userid,article)
			end
		end
	end


	def get_image_of_the_day(language)
		WikipediaRestClient.set_language(language)
		begin
			image = WikipediaRestClient.get_image_of_the_day
			title = image.title
			thumbnail_url = image.thumbnail
			image_commons_page = COMMONS_IMAGE_PAGE_BASE_URL + title
			text = image.description_text
		rescue  
			WikipediaRestClient.set_language("en")
			image = WikipediaRestClient.get_image_of_the_day
			title = image.title
			thumbnail_url = image.thumbnail
			image_commons_page = COMMONS_IMAGE_PAGE_BASE_URL + title
			text = image.description_text
		end
		template = GENERIC_TEMPLATE_BODY
		template[:attachment][:payload][:elements] = [{
            "title": title,
            "subtitle": text,
            "image_url": thumbnail_url,
            "default_action": {
        		"type": "web_url",
        		"url": image_commons_page
      		},
            "buttons":[
            	{
              		"type": "web_url",
              		"title": MessengerBot::VIEW_ON_BROWSER_BUTTON["#{language}"],
              		"url": image_commons_page
            	}
        	]      
        }]
		template
	end

end