class User < ApplicationRecord
  has_many :user_itineraries 
  has_many :itineraries, through: :user_itineraries
  has_many :comments
  has_many :places, through: :comments
  validates_presence_of :username, :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :username, :email
  has_secure_password

  #returns array of people you have travelled with
  def travel_buddies
    itin = self.itineraries
    
    travelers = itin.map do |i|
      i.users
    end

    buddies = travelers.flatten.select do |t|
      t != self
    end
    
    buddies.uniq
  end
  
  def motivation
    messages = ["You are sooo good lookin!", "You are crushing it...","You look really good today.", "It's your world. We are just living in it.", "You can do this!", "Travel is your key to the world.", "Travel nurtures the soul."]
    messages.sample
  end

end
