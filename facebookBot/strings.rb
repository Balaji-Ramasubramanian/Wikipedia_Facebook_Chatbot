# @author Balaji
class MessengerBot

	# Supported Languages
	SUPPORTED_LANGUAGE = ["en", "ta"]
	# Greeting Text:
	GREETING_MESSAGE = {
		"en" => "Hey! I am Wiki bot. Ask me to fetch a particular Wikipedia article or random article.",
		"ta" => "வணக்கம்! விக்கி பாட் உங்களை வரவேற்கிறது. ஒரு குறிப்பிட்ட விக்கிப்பீடியா கட்டுரை அல்லது பரிந்துரைப்பு கட்டுரை ஒன்றை பெற நான் உதவுவேன்."
	}

	# Quick reply header text:
	QUICK_REPLY_HEADER = {
		"en" => "How can I help you?",
		"ta" => "நான் உங்களுக்கு ஏவ்வாறு உதவ வேண்டும்?"
	}

	# Quick reply option texts:
	QUICK_REPLY_OPTIONS = {
		"Random Article" => {
			"en" => "Random Article",
			"ta" => "ஏதாவது ஒரு கட்டுரை"
		},
		"Most Read" => {
			"en" => "Most Read",
			"ta" => "அதிகம் வாசித்தது"
		},
		"Featured Article" => {
			"en" => "Featured Article",
			"ta" => "சிறப்பு கட்டுரை"
		},
		"Image Of The Day" => {
			"en" => "Image Of The Day",
			"ta" => "இன்றைய சிறப்பு படம்"
		},
		"On This Day" => {
			"en" => "On This Day",
			"ta" => "இன்றைய நாளில்"
		},
		"News" => {
			"en" => "News",
			"ta" => "செய்திகள்" 
		}
	}

	# Error message - Page not found texts:
	PAGE_NOT_FOUND_MESSAGE = {
		"en" => "Sorry, There is no article under this name." ,
		"ta" => "மன்னிக்கவும், அப்படி ஒரு கட்டுரை இல்லை."
	}
	# Error message - most read contents not found texts:
	NO_MOST_READ_CONTENT_MESSAGE = {
		"en" => "Sorry, There is no most read contents available right now.",
		"ta" => "மன்னிக்கவும், இப்போது மிக அதிகமான வாசிப்பு உள்ளடக்கங்கள் இல்லை."
	}
	# Error message - Can't understand users message texts:
	CANT_UNDERSTAND_MESSAGE = {
		"en" => "Sorry, I couldn't understand that.",
		"ta" => "மன்னிக்கவும், எனக்கு புரியவில்லை."
	}
	# Error message - Old News can't be loaded texts:
	CANT_LOAD_OLD_NEWS_MESSAGE = {
		"en" => "Sorry, Couldn't load old news",
		"ta" => "மன்னிக்கவும், பழைய செய்தி கிடைக்கவில்லை"
	}



	# Message Card button texts - Read More:
	READ_MORE_BUTTON = {
		"en" => "Read More",
		"ta" => "மேலும் வாசிக்க"
	}
	# Message Card button texts - View on Browser:
	VIEW_ON_BROWSER_BUTTON = {
		"en" => "View on Browser",
		"ta" => "உலாவியில் பார்க்கவும்"
	}
	# Message Card button texts - Get Summary:
	GET_SUMMARY_BUTTON = {
		"en" => "Get Summary",
		"ta" => "நிகழ்ச்சி சுருக்கம்"
	}

	# Persistant menu button texts - Featured:
	FEATURED = {
		"en" => "Featured",
		"ta" => "சிறப்பு கட்டுரைகள்"
	}
	# Persistant menu button texts - Most Read:
	MOST_READ_MESSAGE = {
		"en" => "Most Read",
		"ta" => "அதிகம் வாசித்தது"
	}
	# Persistant menu button texts - On This Day:
	ON_THIS_DAY_MESSAGE ={
		"en" => "On This Day",
		"ta" => "இன்றைய நாளில்"
	}
	# Persistant menu button texts - Featured Article:
	FEATURED_ARTICLE_MESSAGE = {
		"en" => "Featured Article",
		"ta" => "சிறப்பு கட்டுரை"
	}
	# Persistant menu button texts - Image Of The Day:
	IMAGE_OF_THE_DAY_MESSAGE = {
		"en" => "Image Of The Day",
		"ta" => "இன்றைய சிறப்பு படம்"
	}
	# Persistant menu button texts - News:
	NEWS_MESSAGE = {
		"en" => "News",
		"ta" => "செய்திகள்"
	}
	# Persistant menu button texts - Random Article:
	RANDOM_ARTICLE_MESSAGE = {
		"en" => "Random Article",
		"ta" => "ஏதாவது ஒரு கட்டுரை"
 	}

 	# Button texts - Subscription: 
 	SUBSCRIPTION_BUTTON = {
 		"en" => "My Subscriptions",
 		"ta" => "என் சந்தாக்கள்"
 	}
 	# Button texts - subscribe:
 	SUBSCRIBE_BUTTON = {
 		"en" => "Subscribe",
 		"ta" => "பதிவு"
 	}
 	# Button texts - unsubscribe:
 	UNSUBCRIBE_BUTTON ={
 		"en" => "Unsubscribe",
 		"ta" => "குழுவிலகல்"
 	}
 	# Button texts - Help:
 	HELP_BUTTON = {
 		"en" => "Help",
 		"ta" => "உதவி"
 	}
 	# Button texts - More:
 	MORE_BUTTON = {
 		"en" => "More",
 		"ta" => "மேலும்"
 	}


 	# Daily Featured contents message texts - Featured Article:
 	CHECKOUT_FEATURED_ARTICLE = {
 		"en" => "Check out today's featured article!",
 		"ta" => "இன்றைய சிறப்பு கட்டுரை பாருங்கள்!"
 	}
 	# Daily Featured contents message texts - Image Of The Day:
 	CHECKOUT_IMAGE_OF_THE_DAY = {
 		"en" => "Check out the image of the day!",
 		"ta" => "இன்றைய சிறப்பு படத்தை பாருங்கள்!"
 	}
	# Daily Featured contents message texts - News:
 	CHECKOUT_NEWS = {
 		"en" => "Here are the top news trending today!",
 		"ta" => "இன்றைய முன்னணி செய்திகள்!"
 	}
 	# Daily Featured contents message texts - On This Day:
 	CHECKOUT_ON_THIS_DAY = {
 		"en" => "Here are the on this day contents!",
 		"ta" => "இந்த நாளில் உள்ளடக்கங்கள்!"
 	}

end