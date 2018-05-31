FB_PAGE = "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=" + ENV["FB_ACCESS_TOKEN"]
FB_MESSAGE = "https://graph.facebook.com/v2.6/me/messages?access_token=" + ENV["FB_ACCESS_TOKEN"]
FB_PROFILE = "https://graph.facebook.com/v2.6/"
FB_PROFILE_FIELDS = "?fields=first_name,last_name,profile_pic,locale,gender&access_token=" + ENV["FB_ACCESS_TOKEN"]
HEADER = { "Content-Type" => "application/json" }

WIKIPEDIA_LOGO = "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/320px-Wikipedia-logo-v2.svg.png"
COMMONS_IMAGE_PAGE_BASE_URL = "https://commons.wikimedia.org/wiki/"