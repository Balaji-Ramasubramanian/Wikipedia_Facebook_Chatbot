require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

# @author Balaji
# This Class used to perform RakeTasks
#
class RakeTaskClass

	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [nil]
	# This method is used to send the news contents to the corresponding subscribed users.
	#
	def send_news(language)
		puts "Sending news..."
		subscribed_users = User.select("facebook_userid").where("locale like ? AND news_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_news("#{language}")
			if article != nil then
				subscribed_users.each do |users|
					MessengerBot.say(users.facebook_userid,MessengerBot::CHECKOUT_NEWS["#{language}"])
					MessengerBot.post_template(users.facebook_userid,article)
				end
			end
		end
	end

	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [JSON] This JSON object contains the template contents (title,payload).
	# This method will be called from send_news method to fetch the news contents from Wikipedia.
	#
	def get_news(language)
		WikipediaRestClient.set_language(language)
		date = Time.now.strftime("%Y/%m/%d")
		begin
			news = WikipediaRestClient.get_news
			raise 'NilClassException' if news == nil
		rescue  
			WikipediaRestClient.set_language("en")
			news = WikipediaRestClient.get_news
		end
		template = GENERIC_TEMPLATE_BODY
		elements = []
		(0..9).each { |i|
			break if i > news.length-1

			text =  news[i]["story"]
			new_element = {
		            "title": text,
		            "buttons":[
		            	{
		              		"type": "postback",
		              		"title": MessengerBot::GET_SUMMARY_BUTTON["#{language}"],
		              		"payload": "GET_NEWS_SUMMARY_#{i}_#{date}"  # Add date value with the payload
		            	}
		            ]
		    }
		    elements << new_element		
		}
		template[:attachment][:payload][:elements] = elements
		template 
	end

end