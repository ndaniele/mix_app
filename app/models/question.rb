class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates_presence_of :query
  #accepts_nested_attributes_for :answers 

  def answers_attributes=(answers_attributes)
    #raise answers_attributes.inspect
    answers_attributes.each do |answer_attributes|
      self.answers.build(answer_attributes[1])  
      #=>"answers_attributes"=>{"0"=>{"input"=>"no", "user_id"=>"1"}}
    end
  end

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

end
