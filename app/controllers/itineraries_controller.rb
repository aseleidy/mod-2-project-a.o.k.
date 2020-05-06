class ItinerariesController < ApplicationController 

  def index
    @itineraries = Itinerary.all 
  end 

  def show
    @itinerary = Itinerary.find(params[:id]) 
    @current_user = current_user
  end 

  def new 
    @itinerary = Itinerary.new
  end 

  def create 
    @itinerary = Itinerary.create!(itin_params)
    @itinerary.users << current_user

    if @itinerary.save 
      redirect_to @itinerary
    else 
      render :new
    end 

  end 

  def destroy 
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to itineraries_path
  end 

  def like
    find_itin
    @itinerary.likes += 1
    @itinerary.save
    redirect_to @itinerary
  end



  private 
  
  def itin_params
    params.require(:itinerary).permit(:title, :destination_id, user_ids:[])
  end 

  def find_itin 
    @itinerary = Itinerary.find(params[:id])
  end 
end 