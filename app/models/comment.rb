class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :question
    validates :user, :body, :question, presence: true
end
