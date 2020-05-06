class User < ApplicationRecord
  has_many :user_itineraries 
  has_many :itineraries, through: :user_itineraries

  has_many :comments
  has_many :places, through: :comments

  validates_presence_of :username, :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :username, :email
  has_secure_password
end
