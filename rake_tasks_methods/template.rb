# @author Balaji
# This Class used to perform RakeTasks
#
class RakeTaskClass 

  # It is a JSON template for GenericTemplate-MessengerCard.
  GENERIC_TEMPLATE_BODY = {
    "attachment": {
      "type": "template",
      "payload":{
        "template_type": "generic",
         "elements":[{
            "title": "",
            "subtitle": "",
            "buttons":[{
              "type": "",
              "title": "",
              "payload": ""
            }]      
          }]
      }
    }
  }

  # @param id [Integer] The receiver's Facebook user ID.
  # @param template [JSON] The MessageCard to be posted to user's Messager chat.
  # @return [nil]
  # This method helps to post the Scheduled messages to user's Messenger chat.
  #
  def self.post_scheduled_posts(id,template)
    message_options = {
      "recipient": { "id": "#{id}"},
      "message": "#{template.to_json}",
      "messaging_type": "MESSAGE_TAG",
      "tag": "CONFIRMED_EVENT_UPDATE"
      }
    res = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options.to_json)
  end
  
  # @param recipient_id [Integer] The receiver's Facebook user ID.
  # @param text [String] The text content that has to be sent to the user.
  # @return [nil].
  # This method is used to post a text message to address the scheduled content.
  #
  def self.post_scheduled_posts_text(recipient_id, text)
    message_options = {
      messaging_type: "MESSAGE_TAG",
      tag: "CONFIRMED_EVENT_UPDATE",
      recipient: { id: recipient_id },
      message: { text: text }
    }
    res = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options.to_json)
  end

end