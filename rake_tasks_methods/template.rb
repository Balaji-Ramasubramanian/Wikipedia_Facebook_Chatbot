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
    "messaging_type": "RESPONSE",
        "recipient": { "id": "#{id}"},
        "message": "#{template.to_json}",
        "messaging_type": "MESSAGE_TAG",
        "tag": "NON_PROMOTIONAL_SUBSCRIPTION"
        }
    res = HTTParty.post(FB_MESSAGE, headers: HEADER, body: message_options.to_json)
  end
  
end