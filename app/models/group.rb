class Group < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
end

def user_name_from_membership
  self.memberships.each do |memebership|
    user_id = memebership.user_id
    member = User.find_by(:id => user_id)
  end
   member.name 
end

  