class Itinerary < ApplicationRecord
  belongs_to :destination
  has_many :user_itineraries 
  has_many :users, through: :user_itineraries
  has_many :itinerary_places
  has_many :places, through: :itinerary_places

  def fellow_traveler_first_names
    itin_travelers = self.users.map do |user|
      user.first_name
    end 

    itin_travelers.join(', ')
  end 
end
