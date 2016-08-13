require 'pry'
class Question < ApplicationRecord
  has_many :answers
  accepts_nested_attributes_for :answers 

  def answers_count
    self.answers.count
  end 

  def yes_count
    count = 0
    self.answers.map do |answer|
      if answer.input == "yes"
        count += 1
      end
      return count
    end
  end

   def no_count
    count = 0
    self.answers.map do |answer|
      if answer.input == "no"
        count += 1
      end
      return count
    end
  end



end
