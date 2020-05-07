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

  def places_not_included
    self.destination.places - self.places
  end 

  def recommended_places
    places_sorted_by_likes = places_not_included.sort_by do |place|
      place.likes
    end 

    places_sorted_by_likes.reverse.first(5)
  end 

  def place_categories 
    place_categories_array = self.places.map do |place| 
      place.category
    end 
    place_categories_array.compact
  end

  def most_popular_category
    place_categories.max_by {|i| place_categories.count(i) }
  end 

  def places_not_included_or_recommended
    places_not_included - recommended_places
  end 

  def most_popular_places_not_included_from_most_popular_category(most_popular_category)
    new_places_from_category = places_not_included_or_recommended.select do |place|
      place.category == most_popular_category
    end 

    most_liked_new_places_from_category = new_places_from_category.sort_by do |place|
      place.likes 
    end 

    most_liked_new_places_from_category.reverse.first(5)
  end 

end
