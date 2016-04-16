class Feedback < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  
  def headers
    {
      :subject => "CFC Feedback Form",
      :to => "your_email@example.org",
      :from => %("#{name}" <#{email}>)
    }
  end
end 
