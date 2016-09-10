class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates_presence_of :query
  validates :query, length: { maximum: 140, too_long: "- %{count} characters is the maximum allowed" }
  #accepts_nested_attributes_for :answers 

  groupify :group_member

  def answers_attributes=(answers_attributes)
    #raise answers_attributes.inspect
    answers_attributes.each do |id, answer_attributes|
      self.answers.build(answer_attributes)  
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
    elsif no_count > yes_count
      "NO"
    elsif yes_count = no_count
      "TIE"      
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
