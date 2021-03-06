class PlacesController < ApplicationController 
  def show 
    @place = Place.find(params[:id])
    @current_user = current_user
  end 
  
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @place = Place.new
  end 

  def create
    @place = Place.new(place_params)
    @itinerary = Itinerary.find(itinerary_params[:identify])
    @place.itineraries << @itinerary
    @place.destination = @itinerary.destination
      if @place.save
        redirect_to edit_itinerary_path(@itinerary)
      else 
        render :new
      end
  end 

  def like
    @place = Place.find(params[:id])
    @place.likes += 1
    @place.save
    redirect_to @place
  end

  private 
  
  def itinerary_params
    params.require(:place).permit(:identify)
  end 

  def place_params
    params.require(:place).permit(:name, :category, :url, :img_url, :destination_id)
  end

end 