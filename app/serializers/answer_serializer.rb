class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :user, :answer_text, :created_at
  belongs_to :user
end
