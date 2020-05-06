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
end
