# Use this file to easily define all of your cron jobs.
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
# en
#
job_type :runner,  "cd :path && bin/rails runner -e development ':task' :output"
set :output, "#{path}/log/schedule_log.log"
 every 1.minutes do
 	command "ls"
 	runner 'Room.inactive_Rooms'
    #runner "Room.Inactive_Rooms"
 end


