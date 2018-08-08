# @author Balaji
class MessengerBot 
  # Generic template JSON body
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

  # Button Template JSON body
  BUTTON_TEMPLATE_BODY = {
    "attachment":{
    "type": "",
    "payload":{
        "template_type": "button",
        "text": "",
        "buttons":[
          {
            "type": "",
            "url": "",
            "title": ""
          }
        ]
      }
    }
  }
end