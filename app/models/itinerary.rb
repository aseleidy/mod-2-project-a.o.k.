class Itinerary < ApplicationRecord
  belongs_to :destination
  has_many :user_itineraries 
  has_many :users, through: :user_itineraries
  has_many :itinerary_places
  has_many :places, through: :itinerary_places

  before_validation :set_likes_to_zero
  

  def fellow_traveler_first_names
    itin_travelers = self.users.map do |user|
      user.first_name
    end 

    itin_travelers.join(', ')
  end 



  # def likes= 
  #   if self.likes == nil 
  #     self.likes = 0 
  #   end 
  # end

end
