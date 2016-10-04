class GroupQuestion < ApplicationRecord
  belongs_to :group
  belongs_to :question
  
end