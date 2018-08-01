# Use this/webhook file to easily define all of your cron jobs
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 1.day, at: '7:30 am' do
        rake "send_featured_article"
end

every 1.day, at: '8:00 am' do
        rake "send_image_of_the_day"
end

every 1.day, at: '8:30 am' do
        rake "send_news"
end

every 1.day, at: '6:00 am' do
        rake "send_on_this_day"
end