require_relative "../../strings"

class MessengerBot

  PERSISTENT_MENU_STRING_DEFAULT =
    {
        "locale": "default",
         "composer_input_disabled": false,
        "call_to_actions": [
          {
            "title": RANDOM_ARTICLE_MESSAGE["en"],
            "type": "postback",
            "payload": "RANDOM_ARTICLE"
          },
          {
            "title": FEATURED["en"],
            "type": "nested",
            "call_to_actions": [
              {
                "title": FEATURED_ARTICLE_MESSAGE["en"],
                "type": "postback",
                "payload": "FEATURED_ARTICLE"
              },
              {
                "title": IMAGE_OF_THE_DAY_MESSAGE["en"],
                "type": "postback",
                "payload": "IMAGE_OF_THE_DAY"
              },
              {
                "title": NEWS_MESSAGE["en"],
                "type": "postback",
                "payload": "NEWS"
              },
              {
                "title": MOST_READ_MESSAGE["en"],
                "type": "postback",
                "payload": "MOST_READ"
              },
              {
                "title": ON_THIS_DAY_MESSAGE["en"],
                "type": "postback",
                "payload": "ON_THIS_DAY"
              }

            ]
          },
          {
            "title": MORE_BUTTON["en"],
            "type": "nested",
            "call_to_actions": [
              {
                "title": SUBSCRIPTION_BUTTON["en"],
                "type": "postback",
                "payload": "SUBSCRIPTION"
              },
              {
                "title": HELP_BUTTON["en"],
                "type": "postback",
                "payload": "HELP"
              }
            ]
          }
        ]
      }

end