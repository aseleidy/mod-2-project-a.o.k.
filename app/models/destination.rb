class Destination < ApplicationRecord
  has_many :places
  has_many :itineraries 

  def self.sort_alpha
    Destination.all.sort_by do |dest|
      dest.city
    end 
  end 

  def full_info
    "#{city} (#{country})"
  end 

  def five_itineraries 
    self.itineraries.sample(5) 
  end 

  def most_popular_places 
    places_popularity = self.places.sort_by do |place|
      place.itineraries.count
    end 
    places_popularity.last(10)
  end 

  def self.most_popular
    sorted_destinations = Destination.all.sort_by do |dest|
      dest.itineraries.count
    end 

    sorted_destinations.reverse
  end 
end
