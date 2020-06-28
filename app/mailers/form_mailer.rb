class FormMailer < ApplicationMailer
  def new_form_email
    @form = params[:form]
    mail(to: ENV['SEND_MAIL_TO'], subject: ENV['SUBJECT_EMAIL'])
  end
end
