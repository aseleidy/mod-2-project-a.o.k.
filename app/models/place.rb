class Place < ApplicationRecord
  belongs_to :destination
  has_many :itinerary_places
  has_many :itineraries, through: :itinerary_places
  has_many :comments
  has_many :users, through: :comments
  
  before_validation :set_likes_to_zero
  validates_presence_of :name, :category, :img_url
  validates_uniqueness_of :name, :url, :img_url

end
