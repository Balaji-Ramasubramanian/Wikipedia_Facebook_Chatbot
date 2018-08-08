require_relative "../strings"
Dir[File.join(__dir__, './persistent_menu_strings', '*')].each { |file| require file }

# @author Balaji
class MessengerBot
  # Persistent menu contents
  PERSISTENT_MENU = {
    "persistent_menu": [
      PERSISTENT_MENU_STRING_DEFAULT,
      PERSISTENT_MENU_STRING_TA
    ]
  }

end