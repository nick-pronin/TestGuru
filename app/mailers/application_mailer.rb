class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru", <vertupro061@gmail.com>}
  layout 'mailer'
end
