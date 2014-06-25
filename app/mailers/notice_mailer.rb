class NoticeMailer < ActionMailer::Base
  default from: 'XXXXX@xxxxxx.co.jp'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(greeting, text, address, subject)
    @greeting = greeting

    @text = text
    mail to: address, subject: subject
  end
end
