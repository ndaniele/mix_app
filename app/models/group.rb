class Group < ActiveRecord::Base
  groupify :group, members: [:users, :questions], default_members: :users
end
