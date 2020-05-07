class Place < ApplicationRecord
  belongs_to :destination
  has_many :itinerary_places
  has_many :itineraries, through: :itinerary_places
<<<<<<< HEAD
  
  has_many :comments
  has_many :users, through: :comments
=======

  validates_presence_of :name, :img_url
>>>>>>> e38e15a82210bc420770fb3c964bc517d16ad72d
end
