class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
  
  def submission_notification(submission)
        @submission = submission
        admins = User.where(admin: true)
        
        mail(
                 to: admins.map(&:email).uniq, 
                  subject: "New PFV Submission", 
                ) do |format|
                  format.html
        end
        # mail to: admin, subject: "PFV New Submission"
        
        # administrator.each do |admin|
        #   mail to: admin.email, subject: "PFV New Submission"
        # end
  end
  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
