class EnquiriesMailer < ActionMailer::Base
  default from: "hello@nativetongue.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiries.confirmation.subject
  #
  def confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiries.received.subject
  #
  def received(enquiry)
    @enquiry = enquiry
    subject = "New Apps Consulting Lead!"
    subject = "THIS IS A TEST ------" +  subject unless Rails.env.production?

    mail to: %w(matthew@nativetongue.com james@nativetongue.com), subject: subject
  end
end
