class EnquiryMailer < ActionMailer::Base
  default from: "prindaus@gmail.com"

  def enquiry_email(enquirer)
  	@enquirer = enquirer
  	# @users = User.all
  	# @users_emails = @users.map(&:email)

  	mail(:bcc => "prindaus@gmail.com", :subject => "Website enquiry")
  end

end
