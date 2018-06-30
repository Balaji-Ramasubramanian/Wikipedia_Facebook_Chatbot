require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

class RakeTaskClass

	def send_news(language)
		subscribed_users = User.select("facebook_userid").where("locale like ? AND news_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_news("#{language}")
			if article != nil then
				subscribed_users.each do |users|
					MessengerBot.post_template(users.facebook_userid,article)
				end
			end
		end
	end

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