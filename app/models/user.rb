class User < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers #=> user.questions = all questions a user has answered
  has_many :asked_questions, class_name: 'Question' #=> user.asked_questions = all questions a user has asked

  enum role: [:guest, :user, :moderator, :admin] #=> for pundit, if needed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
  
end
