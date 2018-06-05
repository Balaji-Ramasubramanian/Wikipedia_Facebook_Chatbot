require 'wikipedia_rest_client'
require 'date'
class MessengerBot

	def self.get_today_featured_article(id)
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
              		"title": READ_MORE_BUTTON["#{@language}"],
              		"url": url
            	}
        	]      
        }]
		post_template(id,template)
	end



	def self.get_image_of_the_day(id)
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
              		"title": VIEW_ON_BROWSER_BUTTON["#{@language}"],
              		"url": image_commons_page
            	}
        	]      
        }]
		post_template(id,template)
	end




	def self.get_on_this_day(id)
		date = Time.now.strftime("%Y/%m/%d")
		begin
			on_this_day_content = WikipediaRestClient.get_on_this_day
			raise 'NilClassException' if on_this_day_content == nil
		rescue  
			WikipediaRestClient.set_language("en")
			on_this_day_content = WikipediaRestClient.get_on_this_day
		end
		template = GENERIC_TEMPLATE_BODY
		elements = []
		for i in 0..9 
			break if i > on_this_day_content.length-1
			text =  on_this_day_content[i]["text"]
			year = on_this_day_content[i]["year"]
			new_element = {
					"title": "On #{year}",
		            "subtitle": text,
		            "buttons":[
		            	{
		              		"type": "postback",
		              		"title": GET_SUMMARY_BUTTON["#{@language}"],
		              		"payload": "GET_ON_THIS_DAY_SUMMARY_#{i}_#{date}"  # Add date value with the payload
		            	}
		            ]
		    }
		    elements << new_element		
		end
		template[:attachment][:payload][:elements] = elements
		post_template(id,template)
	end




	def self.get_most_read(id)
		begin
			most_read = WikipediaRestClient.get_most_read
		rescue  
			WikipediaRestClient.set_language("en")
			most_read = WikipediaRestClient.get_most_read
		end
		template = GENERIC_TEMPLATE_BODY
		elements = []
		for i in 0..9 
			break unless most_read 
			break if i > most_read["articles"].length-1
			title =  most_read["articles"][i]["displaytitle"]
			text = most_read["articles"][i]["extract"]
			thumbnail_url = most_read["articles"][i]["thumbnail"]["source"] if most_read["articles"][i]["thumbnail"]
			thumbnail_url = WIKIPEDIA_LOGO unless most_read["articles"][i]["thumbnail"]
			url = most_read["articles"][i]["content_urls"]["desktop"]["page"]
			new_element = {
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
		              		"title": READ_MORE_BUTTON["#{@language}"],
		              		"url": url
		            	}
        			] 
		    }
		    elements << new_element		
		end
		if elements != nil then
			template[:attachment][:payload][:elements] = elements
			post_template(id,template)
		else
			say(id, MOST_READ_CONTENT_NOT_FOUND_MESSAGE["#{@language}"])
		end
	end


	def self.get_news(id)
		date = Time.now.strftime("%Y/%m/%d")
		begin
			news = WikipediaRestClient.get_news
		rescue  
			WikipediaRestClient.set_language("en")
			news = WikipediaRestClient.get_news
		end
		template = GENERIC_TEMPLATE_BODY
		elements = []
		for i in 0..9 
			break if i > news.length-1

			text =  news[i]["story"]
			new_element = {
		            "title": text,
		            "buttons":[
		            	{
		              		"type": "postback",
		              		"title": GET_SUMMARY_BUTTON["#{@language}"],
		              		"payload": "GET_NEWS_SUMMARY_#{i}_#{date}"  # Add date value with the payload
		            	}
		            ]
		    }
		    elements << new_element		
		end
		template[:attachment][:payload][:elements] = elements
		post_template(id,template)
	end



	def self.post_template(id,template)
		message_options = {
		"messaging_type": "RESPONSE",
        "recipient": { "id": "#{id}"},
        "message": "#{template.to_json}"
        }
		res = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options)
	end




	def self.get_on_this_day_summary(date)
		WikipediaRestClient.get_on_this_day(date)
	end

	def self.get_news_summary
		WikipediaRestClient.get_news
	end

	def self.handle_get_summary_postbacks(id,postback)

		if postback.include? "GET_ON_THIS_DAY_SUMMARY"
			date = postback.split("_")[6] # splits the postback payload and get the date from it.
			i = postback.split("_")[5].to_i
			postback = postback.gsub("_#{i}_#{date}","")
			on_this_day_content = get_on_this_day_summary(date)
		end


		if postback.include? "GET_NEWS_SUMMARY"
			date = postback.split("_")[4]
			i = postback.split("_")[3].to_i
			postback = postback.gsub("_#{i}_#{date}","")
			if date == Time.now.strftime("%Y/%m/%d") then
				news_contents = get_news_summary
				news_summary = news_contents[i]["story"]
			else
				news_summary = "Couldn't load old news contents"
			end
		end


		case postback
		when "GET_ON_THIS_DAY_SUMMARY"
			say(id,on_this_day_content[i]["text"])
		when "GET_NEWS_SUMMARY"
			say(id,news_summary)
		else
			say(id, COULDNOT_UNDERSTAND_THAT_MESSAGE["#{@language}"])
		end
	end

end