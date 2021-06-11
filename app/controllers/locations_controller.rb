class LocationsController < ApplicationController 
  before_action :set_location, only: [:show, :update, :destroy, :edit]

  def new 
    @location = Location.new 
  end

  def create 
    @location = Location.new(set_location_params) 
    if @location.save
      flash[:notice] = "Location is successfully created" 
      redirect_to locations_path
    else
      render 'new'
    end
  end
  
  def edit 
  end 

  def show 
  end

  def update 
    if @location.update(set_location_params)
      flash[:notice] = "Location was successfully updated"
      redirect_to @location  
    else
      render 'edit'
    end
  end

  def destroy 
    @location.destroy 
    flash[:notice] = "location was successfully deleted"
    redirect_to locations_path  
  end

  def index 
    @locations = Location.all 
  end

  private 
  def set_location_params 
    params.require(:location).permit(:location_name, :location_type_id, :location_address, :comment)
  end

  def set_location 
    @location = Location.find(params[:id])
  end
end