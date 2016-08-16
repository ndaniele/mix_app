class User < ApplicationRecord
  validates_presence_of :email #, :message => "you need an email"
  validates :email, :uniqueness => true #, :message => "need a unique email"
end
