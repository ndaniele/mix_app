class QuestionAnswerSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :input, :user_id
end
