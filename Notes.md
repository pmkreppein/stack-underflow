Models:

User
    has_many :questions
    has_many :comments, :through => :questions

Comments
    belongs_to :user
    belongs_to :question

Question
    has_many :comments 
    has_many :users, :through =>





class User < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers
end
 
class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
end
 
class Question < ApplicationRecord
  has_many :answers
  has_many :users, :through => :answers

User 
    t.string :name
    t.string :email
    t.timestamps
Answer
    t.belongs_to :user
    t.belongs_to :question
    t.text :answer_text
    t.timestamps

Question
    t.integer :created_by_user
    t.text :question_text
    t.timestamps