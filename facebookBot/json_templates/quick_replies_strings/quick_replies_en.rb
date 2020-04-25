# @author Balaji
class MessengerBot
	
	# Quick Reply template - English(en)	
	QUICK_REPLY_EN = [
			{
		    	"content_type": 'text',
		    	"title": QUICK_REPLY_OPTIONS["Random Article"]["en"],
		    	"payload": 'RANDOM_ARTICLE'
		  	},
		  	{
		    	"content_type": 'text',
		    	"title": QUICK_REPLY_OPTIONS["Featured Article"]["en"],
		    	"payload": 'FEATURED_ARTICLE'
		  	},
			{
		    	"content_type": 'text',
		    	"title": QUICK_REPLY_OPTIONS["Image Of The Day"]["en"],
		    	"payload": 'IMAGE_OF_THE_DAY'
		  	},
		  	{
		    	"content_type": 'text',
		    	"title": QUICK_REPLY_OPTIONS["News"]["en"],
		    	"payload": 'NEWS'
		  	},
		  	{
		    	"content_type": 'text',
		    	"title": QUICK_REPLY_OPTIONS["On This Day"]["en"],
		    	"payload": 'ON_THIS_DAY'
		  	},
		  	{
	    		"content_type": 'text',
	    		"title": QUICK_REPLY_OPTIONS["Most Read"]["en"],
	    		"payload": 'MOST_READ'
	  		}	
	  ]

end