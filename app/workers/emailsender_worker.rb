class EmailsenderWorker
  include Sidekiq::Worker
 # Sidekiq.options queue: 'high'
  def perform(email)
  	puts email
     puts "iiii"
     UserMailer.booking_confirmation(email).deliver_now
 end
end
