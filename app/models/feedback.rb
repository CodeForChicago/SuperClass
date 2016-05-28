class Feedback < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, :validate => true
  attribute :nickname, :captcha => true
  
  # Email headers. Accepts anything the mail method in ActionMailer accepts
  def headers
    {
      :subject => "CFC Feedback Form",
      :to => "codeforchicago@u.northwestern.edu",
      :from => %("#{name}" <#{email}>)
    }
  end
end

