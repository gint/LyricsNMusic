class Mailer < PostageApp::Mailer

	def send_mail_invitation(requests)
		#define postageapp template
		postageapp_template 'invite'

		recipient_list = Hash.new

		requests.each do |request|
			recipient_list[request.email] = { request.id => request.email}
		end
		
	    mail(
	    	  :to => recipient_list
    	)
	end 
  
end
