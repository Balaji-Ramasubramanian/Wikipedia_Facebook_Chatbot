require './app'
require 'rake'
require 'sinatra/activerecord/rake'
require 'sinatra/activerecord'
require 'httparty'
require 'json'
require 'date'

require_relative "./facebookBot/bot"
require_relative "./facebookBot/featured_article"
require_relative "./models/user"
require_relative "./rake_tasks_methods/rake_featured_article"
require_relative "./rake_tasks_methods/rake_image_of_the_day"
require_relative "./rake_tasks_methods/rake_news"
require_relative "./rake_tasks_methods/rake_on_this_day"

# Send Featured article to users
task :send_featured_article do
	
	RakeTaskClass.new.send_featured_article("en")
	RakeTaskClass.new.send_featured_article("ta")

end

# Send Image of the day content to users
task :send_image_of_the_day do

	RakeTaskClass.new.send_image_of_the_day("en")
	RakeTaskClass.new.send_image_of_the_day("ta")

end

# Send news to users
task :send_news do
	RakeTaskClass.new.send_news("en")
	RakeTaskClass.new.send_news("ta")
end

# Send On this day contents to users
task :send_on_this_day do
	RakeTaskClass.new.send_on_this_day("en")
	RakeTaskClass.new.send_on_this_day("ta")
end
