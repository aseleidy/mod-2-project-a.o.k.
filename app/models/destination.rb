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


  def self.most_popular

    destination_array = []
    for i in Itinerary.all
      destination_array << Destination.find_by(id: i.destination_id)
    end

        #iterates through all itineraries, puts the destination at their destination_id into an array.

    destination_hash = Hash.new
    destination_array.each do |destination|
        destination_hash[destination] = destination_array.count(destination)
        #puts each destination in a hash next to it's count in the array. This also should weed out repeats, since the key value will just be overwritten when it hits the destination more than once.
    end
    sorted = destination_hash.sort_by {|key, value| -value}
    sorted
        #orders the hash by the values in descending order, so the destinations with the most hits are listed at the top. Then creates an array out of the keys, 
        #which are destinations objects, listed in order of how popular they are.
        #"Sort_by" converts the hash into an array, apparently. That took me off guard. 
        #Fingers crossed everything displays right.
        
  end
end
