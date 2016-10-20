class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :input, :question_id, :user_id
end
