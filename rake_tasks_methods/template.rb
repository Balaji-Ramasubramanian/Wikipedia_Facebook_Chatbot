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
  
end