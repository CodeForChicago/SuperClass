require 'open-uri'
require 'json'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  self.primary_key = 'username' 
  
  has_many :questions 
  has_many :comments
  
  enum role: [:admin, :student]
	before_validation :set_default_role, :generate_username
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :first_name, :last_name, :role, :username, presence: true
	#validates :username, uniqueness: true
	validates :username, :presence => true, :uniqueness => true 
	def set_default_role
	  self.role ||= :student
	end 
	
  def create
    @user = User.new(params[:user])
    @user.save!
  rescue => err                          # rescues all exceptions
    logger.error(err.to_s) #This is to catch an error in the case that in the future we have multiple deployments working and they both request the same random user at the same time. Very unlikely edge case. Failsafe nonetheless. 
  end 
  
	def fetch_user
	  	res = JSON.parse(open('https://randomuser.me/api/').read)
	    res['results'][0]['login']['username']
	end 
	
  def generate_username
    begin  #The username generated may on rare occasions already exist. So we need to catch cases where the API serves a user we have already used
      self.username = fetch_user()

    rescue # If the appointment to self.username is not unqieu the model will throw an error. If an error is thrown we just call generate username again until we get a unique username. 
      generate_username()
    end
  end 
	
	def name 
	  self.first_name + " " + self.last_name
	end 

end
