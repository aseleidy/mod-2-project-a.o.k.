class ItinerariesController < ApplicationController 
  
  before_action :require_login
  before_action :require_authorization, only: [:show, :edit, :update, :destroy]

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
      redirect_to itinerary_path(@itinerary)
    else 
      render :new
    end 
  end 

  def edit 
    find_itin
  end 

  def update 
    find_itin 

    if @itinerary.update(itin_params)
      redirect_to @itinerary
    else 
      render :edit 
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

  def require_login 
    if !(session.include? :user_id)
      redirect_to login_path
      flash[:message] = "You must be logged in to see those pages."
    end 
  end

  def require_authorization
    @itinerary = Itinerary.find(params[:id])
    
    if !(@itinerary.user_ids.include? session[:user_id])
      redirect_to user_path(current_user) 
      flash[:message] = "You cannot view an itinerary that's not shared with you."
    end 
  end
  
  def itin_params
    params.require(:itinerary).permit(:title, :destination_id, user_ids:[], place_ids:[])
  end 

  def find_itin 
    @itinerary = Itinerary.find(params[:id])
  end 
end 