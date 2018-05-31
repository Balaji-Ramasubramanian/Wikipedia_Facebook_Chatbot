class MessengerBot 

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