class Answer < ApplicationRecord
  belongs_to :question #=> added .question method to answers class (i.e. new_answer.question )
  belongs_to :user
  
  validates_presence_of :input
  validates :user_id && :question_id, :uniqueness => true



  #def find_question_by_answer(user)
  #  answers = Answer.where(:user_id => user.id)
  #  answers.each do |answer|
  #    answer_question = answer.question 
  #  end
  #  answer_question
  #end
#
  #  helper_method :find_question_by_answer(user)
end
