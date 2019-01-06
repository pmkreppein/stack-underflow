class Question < ApplicationRecord
    has_many :answers
    has_many :users, through: :answers

    CATEGORY = ["Ruby/Rails", "JavaScript", "Front End Frameworks", "Native Mobile Development", "JS Mobile Development", "Game/VR Development"]

    validates :category, inclusion: CATEGORY
    validates :question_text, :presence => true
end
