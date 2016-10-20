class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :query, :user_id
  has_many :answers, serializer: QuestionAnswerSerializer
end
