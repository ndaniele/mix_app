class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email #, :message => "you need an email"
  validates :email, :uniqueness => true #, :message => "need a unique email"

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user| #=> SQL the User DB WHERE*
      user.password = SecureRandom.hex
    end
  end

end
