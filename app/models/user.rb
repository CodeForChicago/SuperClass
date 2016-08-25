require 'open-uri'
require 'json'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :questions 
  has_many :comments
  
  enum role: [:admin, :student]
	before_validation :set_default_role, :generate_username
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :first_name, :last_name, :role, :username, presence: true
	validates :username, uniqueness: true
	
	def set_default_role
	  self.role ||= :student
	end 
	
	def fetch_user
	  	res = JSON.parse(open('https://randomuser.me/api/').read)
	    res['results'][0]['login']['username']
	end 
	
  def generate_username
    begin  #The email retrieved may on rare occasions already exist. So we need to catch cases where the API serves a user we have already used
      self.username = fetch_user()
    rescue # If the appointment to self.username is not unqieu the model will throw an error. If an error is thrown we just call generate username again until we get a unique username. 
      generate_username()
    end
  end 
	
	def name 
	  self.first_name + " " + self.last_name
	end 

end
