class Feedback < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  
  def headers
    {
      :subject => "CFC Feedback Form",
      :to => "codeforchicago@u.northwestern.edu",
      :from => %("#{name}" <#{email}>)
    }
  end
end 
