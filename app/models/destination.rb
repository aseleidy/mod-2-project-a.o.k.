class Destination < ApplicationRecord
  has_many :places
  has_many :itineraries 
  has_many :comments, through: :places
  before_validation :set_likes_to_zero

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


  def self.most_liked
    sorted_destinations = Destination.all.sort_by do |dest|
      dest.likes 
    end
    sorted_destinations.reverse
  end




  def trending_places
    place_array = []
    twenty_percent = self.comments.count * 0.2 + 1
    #plus one to ensure it doesn't round down to 0.
    twenty_percent = twenty_percent.round
    recent_twenty_comments = self.comments.reverse.slice(1, twenty_percent)
    recent_twenty_comments.each do |comment|
      place_array << Place.find(comment[:place_id])
    end
    place_array.uniq
  end
# end




  def self.trending
    twenty_percent = Comment.all.count * 0.2 + 1
    #plus one to ensure it doesn't round down to 0.
    destinations = []
    places = []
    most_recent_comments = Comment.all.reverse.slice(1, twenty_percent)
    most_recent_comments.each do |comment|
      places << Place.find(comment.place_id) 
    end
    places.each do |place|
      destinations << Destination.find(place.destination_id)
    end
    destination_hash = Hash.new
    destinations.each do |destination|
      destination_hash[destination] = destinations.count(destination)
    end
    destination_hash.sort_by {|key, value| -value}
    #I found the above line through stack overflow. It orders the hash by values. The minus sign ensures it's descending order. 
    #The syntax is confusing but it's fun to think about.
    destination_hash.keys
  end
end
#I don't know why the above isn't working but it's getting convoluted and needs to be refactored and picked up later. Losing sight of my own reasoning.
