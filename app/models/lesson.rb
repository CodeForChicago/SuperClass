class Lesson < ActiveRecord::Base
	validates :author, :body, :url, :title, presence: true
end
