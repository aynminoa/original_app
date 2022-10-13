class ApplicationMailer < ActionMailer::Base
  default from: 'dicayumi@gmail.com'
          # reply_to: Rails.application.credentials.gmail[:user_name]
          # reply_to: 'dicayumi@gmail.com'
  layout 'mailer'
end
