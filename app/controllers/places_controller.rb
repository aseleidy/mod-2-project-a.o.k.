class PlacesController < ApplicationController 
  def show 
    @place = Place.find(params[:id])
  end 
  
  def new 
    @itinerary = Itinerary.find(params[:id])
    @place = Place.new 
    @itinerary.places << @place 
  end 

  def create 
  end 


end 