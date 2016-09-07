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
    else
      "NO"
    end
  end

   def self.most_popular
    q_ids = []
    Answer.all.each do |answer|
      q_ids << answer.question_id
    end
      q_ids.group_by(&:itself).values.max_by(&:size).first
      #=> returns a question ID (i.e. 4)
  end

end
