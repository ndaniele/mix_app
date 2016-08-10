class Answer < ApplicationRecord
  belongs_to :question
  #added .question method to answers class (i.e. new_answer.question )
end
