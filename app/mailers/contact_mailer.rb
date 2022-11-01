
#Mailer class that will contain action methods to generate an email based on the parameters passed to it. 
#It will use views to structure its contents. 

class ContactMailer < ApplicationMailer
	def contact_email(name, email, subject, message)
		@name = name
	    @email = email
	    @message = message
	    mail(to: "test@yopmail.com", subject: subject)
	end
end
