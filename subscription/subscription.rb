require 'facebook/messenger'
require 'httparty'
require 'json'  
require_relative './subscription_template'
require_relative '../facebookBot/bot'
require_relative '../facebookBot/strings'
require_relative './subscription_strings'
require_relative '../models/user'

class SubscriptionClass

  # To save user subscription information in the database table
  def save_user_profile(id)
    user = User.find_by_facebook_userid(id)
    if user == nil then
      user = User.new 
    end
    user.facebook_userid = id
    profile_details = MessengerBot.get_profile(id)
    user.locale = profile_details["locale"]
    user.featured_article_subscription = true
    user.image_of_the_day_subscription = true
    user.on_this_day_subscription = true
    user.news_subscription = true
    user.save
  end


  # Method to handle subscriptions
  def show_subscriptions(id)
    language = MessengerBot.get_language(id)
    user = User.find_by_facebook_userid(id)
    if user != nil then

      message_option = SUBSCRIPTION_MESSAGE_OPTION
      message_option[:recipient][:id] = id
      message_option[:message][:attachment][:payload][:elements][0][:title] = MessengerBot::FEATURED_ARTICLE_MESSAGE["#{language}"]
      message_option[:message][:attachment][:payload][:elements][1][:title] = MessengerBot::IMAGE_OF_THE_DAY_MESSAGE["#{language}"]
      message_option[:message][:attachment][:payload][:elements][2][:title] = MessengerBot::NEWS_MESSAGE["#{language}"]
      message_option[:message][:attachment][:payload][:elements][3][:title] = MessengerBot::ON_THIS_DAY_MESSAGE["#{language}"]

      if user.featured_article_subscription != true then
        message_option[:message][:attachment][:payload][:elements][0][:subtitle] = UNSUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][0][:buttons][0][:title] = SUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][0][:buttons][0][:payload] = "SUBSCRIBE_FEATURED_ARTICLE"
      else
        message_option[:message][:attachment][:payload][:elements][0][:subtitle] = SUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][0][:buttons][0][:title] = UNSUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][0][:buttons][0][:payload] = "UNSUBSCRIBE_FEATURED_ARTICLE"
      end
      
      if user.image_of_the_day_subscription != true then
        message_option[:message][:attachment][:payload][:elements][1][:subtitle] = UNSUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][1][:buttons][0][:title] = SUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][1][:buttons][0][:payload] = "SUBSCRIBE_IMAGE_OF_THE_DAY"
      else
        message_option[:message][:attachment][:payload][:elements][1][:subtitle] = SUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][1][:buttons][0][:title] = UNSUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][1][:buttons][0][:payload] = "UNSUBSCRIBE_IMAGE_OF_THE_DAY"
      end

      if user.news_subscription != true then
        message_option[:message][:attachment][:payload][:elements][2][:subtitle] = UNSUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][2][:buttons][0][:title] = SUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][2][:buttons][0][:payload] = "SUBSCRIBE_NEWS"
      else
        message_option[:message][:attachment][:payload][:elements][2][:subtitle] = SUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][2][:buttons][0][:title] = UNSUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][2][:buttons][0][:payload] = "UNSUBSCRIBE_NEWS"
      end

      if user.on_this_day_subscription != true then
        message_option[:message][:attachment][:payload][:elements][3][:subtitle] = UNSUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][3][:buttons][0][:title] = SUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][3][:buttons][0][:payload] = "SUBSCRIBE_ON_THIS_DAY"
      else
        message_option[:message][:attachment][:payload][:elements][3][:subtitle] = SUBSCRIBED_SUBTITLE_TEXT["#{language}"]
        message_option[:message][:attachment][:payload][:elements][3][:buttons][0][:title] = UNSUBSCRIBE_BUTTON["#{language}"]
        message_option[:message][:attachment][:payload][:elements][3][:buttons][0][:payload] = "UNSUBSCRIBE_ON_THIS_DAY"
      end
      res = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_option.to_json)

    end
  end



  # Add subscription for user to Vaccine reminder
  def subscribe(id,category)
    language = MessengerBot.get_language(id)
    user = User.find_by_facebook_userid(id)
    puts "inside subscribe #{category}"
    case category
    when "FEATURED_ARTICLE"
      user.update_attributes( :featured_article_subscription => true)
      MessengerBot.say(id,SUBSCRIBED_FEATURED_ARTICLE_TEXT["#{language}"])
    when "IMAGE_OF_THE_DAY"
      user.update_attributes( :image_of_the_day_subscription => true)
      MessengerBot.say(id,SUBSCRIBED_IMAGE_OF_THE_DAY_TEXT["#{language}"])
    when "NEWS"
      user.update_attributes( :news_subscription => true)
      MessengerBot.say(id,SUBSCRIBED_NEWS_TEXT["#{language}"])
    when "ON_THIS_DAY"
      user.update_attributes( :on_this_day_subscription => true)
      MessengerBot.say(id,SUBSCRIBED_ON_THIS_DAY_TEXT["#{language}"])
    end
  end

  # Unsubscribe a User from Vaccine reminder 
  def unsubscribe(id,category)
    language = MessengerBot.get_language(id)
    user = User.find_by_facebook_userid(id)
    puts "inside unsubscribe #{category}"
    case category
    when "FEATURED_ARTICLE"
      user.update_attributes( :featured_article_subscription => false)
      MessengerBot.say(id,UNSUBSCRIBED_FEATURED_ARTICLE_TEXT["#{language}"])
    when "IMAGE_OF_THE_DAY"
      user.update_attributes( :image_of_the_day_subscription => false)
      MessengerBot.say(id,UNSUBSCRIBED_IMAGE_OF_THE_DAY_TEXT["#{language}"])
    when "NEWS"
      user.update_attributes( :news_subscription => false)
      MessengerBot.say(id,UNSUBSCRIBED_NEWS_TEXT["#{language}"])
    when "ON_THIS_DAY"
      user.update_attributes( :on_this_day_subscription => false)
      MessengerBot.say(id,UNSUBSCRIBED_ON_THIS_DAY_TEXT["#{language}"])
    end
  end 


end