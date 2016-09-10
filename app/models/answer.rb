class Answer < ApplicationRecord
  belongs_to :question #=> added .question method to answers class (i.e. new_answer.question )
  belongs_to :user
  
  validates_presence_of :input
  validates_uniqueness_of :user_id, scope: :question_id


  def answers_count
    self.question.answers.count
  end 

  def yes_count
    self.question.answers.where(input: "yes").count
  end

  def no_count
    self.question.answers.where(input: "no").count
  end

   def winner 
    if yes_count > no_count
      "YES"
    elsif no_count > yes_count
      "NO"
    elsif yes_count = no_count
      "TIE"      
    end
  end

end
