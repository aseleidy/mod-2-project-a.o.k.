class DestinationsController < ApplicationController 
  def index 
    @destinations = Destination.all
  end 

  def show
    @destination = Destination.find(params[:id]) 
  end
  
  def like
    @destination = Destination.find(params[:id])
    @destination.likes += 1
    @destination.save
    redirect_to @destination
  end



end 