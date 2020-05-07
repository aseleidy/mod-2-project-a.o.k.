class Place < ApplicationRecord
  belongs_to :destination
  has_many :itinerary_places
  has_many :itineraries, through: :itinerary_places
  
  has_many :comments
  has_many :users, through: :comments

  validates_presence_of :name, :img_url
end
