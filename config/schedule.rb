
job_type :runner,  "cd :path && bin/rails runner -e development ':task' :output"
set :output, "#{path}/log/schedule_log.log"
 every 1.day do
  	runner 'Room.inactive_Rooms'
 end


