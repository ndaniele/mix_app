class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates_presence_of :query
  #accepts_nested_attributes_for :answers 


  def answers_count
    self.answers.count
  end 

  def yes_count
    self.answers.where(input: "yes").count
  end

  def no_count
    self.answers.where(input: "no").count
  end

  def winner 
    if yes_count > no_count
      "YES"
    else
      "NO"
    end
  end


#def most_common_value(a)
#  a.group_by(&:itself).values.max_by(&:size).first
#end



  #helper_method :most_popular

end
