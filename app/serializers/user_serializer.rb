class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role
  has_many :questions
end
