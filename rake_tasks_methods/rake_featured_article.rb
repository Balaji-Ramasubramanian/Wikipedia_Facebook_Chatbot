require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

class RakeTaskClass
	
	def send_featured_article(language)
		subscribed_users = User.select("facebook_userid").where("locale like ? AND featured_article_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_featured_article("#{language}")
			subscribed_users.each do |users|
				MessengerBot.post_template(users.facebook_userid,article)
			end
		end
	end


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