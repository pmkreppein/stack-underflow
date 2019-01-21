class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :category, :user, :question_text
  belongs_to :user, serializer: UserSerializer
  has_many :answers, serializer: AnswerSerializer
end
