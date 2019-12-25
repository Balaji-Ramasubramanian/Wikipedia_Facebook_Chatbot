require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

# @author Balaji
# This Class used to perform RakeTasks
#
class RakeTaskClass
	
	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [nil]
	# This method used to send Featured article to subscribed users
	#
	def send_featured_article(language)
		subscribed_users = User.select("facebook_userid").where("locale like ? AND featured_article_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_featured_article("#{language}")
			subscribed_users.each do |user|
				puts "Sending featured articles to userid = " + user.facebook_userid.to_s
				MessengerBot.say(user.facebook_userid,MessengerBot::CHECKOUT_FEATURED_ARTICLE["#{language}"])
				MessengerBot.post_template(user.facebook_userid,article)
			end
		end
	end

	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [JSON] A JSON object that contains template contents (title,subtitle,payload).
	# This method will be called from send_featured_article method to fetch the Featured article contents from Wikipedia.
	#
	def get_featured_article(language)
		WikipediaRestClient.set_language(language)
		begin
			today_featured_article = WikipediaRestClient.get_featured_article
			title = today_featured_article.title
			url = today_featured_article.url
			thumbnail_url = today_featured_article.thumbnail_source if today_featured_article.thumbnail_source
			thumbnail_url = WIKIPEDIA_LOGO unless  today_featured_article.thumbnail_source
			text = today_featured_article.text
		rescue
			WikipediaRestClient.set_language("en")
			today_featured_article = WikipediaRestClient.get_featured_article
			title = today_featured_article.title
			url = today_featured_article.url
			thumbnail_url = today_featured_article.thumbnail_source if today_featured_article.thumbnail_source
			thumbnail_url = WIKIPEDIA_LOGO unless  today_featured_article.thumbnail_source
			text = today_featured_article.text
		end
		template = GENERIC_TEMPLATE_BODY
		template[:attachment][:payload][:elements] = [{
            "title": title,
            "subtitle": text,
            "image_url": thumbnail_url,
            "default_action": {
        		"type": "web_url",
        		"url": url
      		},
            "buttons":[
            	{
              		"type": "web_url",
              		"title": MessengerBot::READ_MORE_BUTTON["#{language}"],
              		"url": url
            	}
        	]      
        }]
		template
	end

end