require 'wikipedia_rest_client'

class MessengerBot
	
	# To get the random page contents
	def self.get_random(id)
		random_page = WikipediaRestClient.get_random
		post_page(id,random_page,true)
	end

	# To get the specified page contents
	def self.get_page(id,query)
		language = get_language(id)
		page = WikipediaRestClient.get_page(query)
		if page.pageid != nil then
			post_page(id,page)
		else
			say(id,"\"#{query}\" - #{PAGE_NOT_FOUND_MESSAGE["#{language}"]} ")
		end
	end

	# To send the page contents to the user
	def self.post_page(id,page,is_random = false)
		language = get_language(id)
		begin
			title = page.title
			text = page.text
			url = page.url
			thumbnail_url = page.thumbnail_source if page.thumbnail_source
			thumbnail_url = WIKIPEDIA_LOGO unless page.thumbnail_source
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
	              		"title": READ_MORE_BUTTON["#{language}"],
	              		"url": url
	            	}
	        	]      
	        }]
	        post_template(id,template)
	    rescue  
	    	if is_random then
				WikipediaRestClient.set_language("en")
				get_random(id)
			else
				say(id,"\"#{query}\" - #{PAGE_NOT_FOUND_MESSAGE["#{language}"]} ")
			end
		end
	end
end