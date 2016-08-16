class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email #, :message => "you need an email"
  validates :email, :uniqueness => true #, :message => "need a unique email"
end
