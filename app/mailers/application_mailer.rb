class ApplicationMailer < ActionMailer::Base
  default from: "Ayumi Nakano",
          reply_to: Rails.application.credentials.gmail[:user_name]
          # reply_to: ENV['SEND_MAIL']
  layout 'mailer'
end
