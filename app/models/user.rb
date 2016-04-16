class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :questions
  
  enum role: [:admin, :student]
	before_validation :set_default_role
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :first_name, :last_name, :role, presence: true
	
	def set_default_role
	  self.role ||= :student
	end 

end
