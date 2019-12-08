require 'wikipedia_rest_client'

require_relative './template'
require_relative '../facebookBot/strings'

# @author Balaji
# This Class used to perform RakeTasks
#
class RakeTaskClass

	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [nil]
	# This method used to send On this day contents to subscribed users.
	#
	def send_on_this_day(language)
		puts "On this day contents..."
		subscribed_users = User.select("facebook_userid").where("locale like ? AND on_this_day_subscription = ?","#{language}%",true).to_a
		if subscribed_users != nil then
			article = RakeTaskClass.new.get_on_this_day("#{language}")
			subscribed_users.each do |users|
				MessengerBot.say(users.facebook_userid,MessengerBot::CHECKOUT_ON_THIS_DAY["#{language}"])
				MessengerBot.post_template(users.facebook_userid,article)
			end
		end
	end

	# @param language [String] It denotes the language code (Eg: en => English, fr => French,etc.,)
	# @return [JSON] This JSON object contains the template contents (title,subtitle,payload).
	# This method will be called from send_on_this_day method to fetch the On this day contents from Wikipedia.
	#
	def get_on_this_day(language)
		WikipediaRestClient.set_language(language)
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
		(0..9).each { |i|
			break if i > on_this_day_content.length-1
			text =  on_this_day_content[i]["text"]
			year = on_this_day_content[i]["year"]
			new_element = {
					"title": "On #{year}",
		            "subtitle": text,
		            "buttons":[
		            	{
		              		"type": "postback",
		              		"title": MessengerBot::GET_SUMMARY_BUTTON["#{language}"],
		              		"payload": "GET_ON_THIS_DAY_SUMMARY_#{i}_#{date}"  # Add date value with the payload
		            	}
		            ]
		    }
		    elements << new_element		
		}
		template[:attachment][:payload][:elements] = elements
		template
	end

end