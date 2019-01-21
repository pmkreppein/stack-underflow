class QuestionsSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :category, :user, :question_text
  belongs_to :user, serializer: UserSerializer
end
