class Question < ActiveRecord::Base
    belongs_to :user
    validates :user, :body, :title, presence: true
    validates :title, length: {maximum: 128}
end