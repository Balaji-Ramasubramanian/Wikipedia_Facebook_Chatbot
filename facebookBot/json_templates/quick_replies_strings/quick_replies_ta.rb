# @author Balaji
class MessengerBot

	# Quick Reply template - Tamil(ta)
	QUICK_REPLY_TA = [
	  			{
			    	"content_type": 'text',
			    	"title": QUICK_REPLY_OPTIONS["Random Article"]["ta"],
			    	"payload": 'RANDOM_ARTICLE'
			  	},
			  	{
			    	"content_type": 'text',
			    	"title": QUICK_REPLY_OPTIONS["Featured Article"]["ta"],
			    	"payload": 'FEATURED_ARTICLE'
			  	},
				{
			    	"content_type": 'text',
			    	"title": QUICK_REPLY_OPTIONS["Image Of The Day"]["ta"],
			    	"payload": 'IMAGE_OF_THE_DAY'
			  	},
			  	{
			    	"content_type": 'text',
			    	"title": QUICK_REPLY_OPTIONS["News"]["ta"],
			    	"payload": 'NEWS'
			  	},
			  	{
			    	"content_type": 'text',
			    	"title": QUICK_REPLY_OPTIONS["On This Day"]["ta"],
			    	"payload": 'ON_THIS_DAY'
			  	},
			  	{
		    		"content_type": 'text',
		    		"title": QUICK_REPLY_OPTIONS["Most Read"]["ta"],
		    		"payload": 'MOST_READ'
		  		}	
  	]
end