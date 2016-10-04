class Group < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
  
  has_many :group_questions
  has_many :questions, :through => :group_questions
  has_many :answers, :through => :questions


end

def user_name_from_membership
  self.memberships.each do |memebership|
    user_id = memebership.user_id
    member = User.find_by(:id => user_id)
  end
   member.name 
end

  