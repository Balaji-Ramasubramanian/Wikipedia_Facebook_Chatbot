class SubscriptionClass
     SUBSCRIPTION_MESSAGE_OPTION = {
         "messaging_type": "RESPONSE",
         "recipient": { "id": "0" },
         "message":{
           "attachment":{
             "type": 'template',
             "payload":{
               "template_type": "generic",
               "elements":[
                 {
                   "title": "Featured Article",
                   "subtitle": "You are now Unsubscribed!",
                   "buttons":[
                      {
                        "type": "postback",
                        "title": "Subscribe",
                        "payload": "SUBSCRIBE"
                      }            
                    ]   
                },
                {
                   "title": "Image of the day",
                   "subtitle": "You are now Unsubscribed!",
                   "buttons":[
                      {
                        "type": "postback",
                        "title": "Subscribe",
                        "payload": "SUBSCRIBE"
                      }             
                    ]   
                },
                {
                   "title": "News",
                   "subtitle": "You are now Unsubscribed!",
                   "buttons":[
                      {
                        "type": "postback",
                        "title": "Subscribe",
                        "payload": "SUBSCRIBE"
                      }            
                    ]   
                },
                {
                   "title": "On this day",
                   "subtitle": "You are now Unsubscribed!",
                   "buttons":[
                      {
                        "type": "postback",
                        "title": "Subscribe",
                        "payload": "SUBSCRIBE"
                      }           
                    ]   
                }
              ]
              }  
            }
          }
        }

  end