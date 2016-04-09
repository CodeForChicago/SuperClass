class Lesson < ActiveRecord::Base
	validates :author, :body, :url, :title, presence:{ message: 'Empty entry not allowed'}
	validates :url, uniqueness: {case_sensitive: false, message: 'This url has already been taken!'}
	validates :title, uniqueness: {scope: :author, message: 'Another entry by the author already exists!'} 
end
