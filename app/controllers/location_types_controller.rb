class LocationTypesController < ApplicationController 
  before_action :set_location_type, only: [:show, :update, :destroy, :edit]

  def new 
    @location_type = LocationType.new 
  end

  def create 
    @location_type = LocationType.new(set_location_type_params) 
    if @location_type.save
      flash[:notice] = "Location Type is successfully created" 
      redirect_to location_types_path
    else
      render 'new'
    end
  end
  
  def edit 
  end 

  def show 
  end

  def update 
    if @location_type.update(set_location_type_params)
      flash[:notice] = "Location Type was successfully updated"
      redirect_to @location_type  
    else
      render 'edit'
    end
  end

  def destroy 
    @location_type.destroy 
    flash[:notice] = "location type was successfully deleted"
    redirect_to location_types_path  
  end

  def index 
    @location_types = LocationType.all 
  end

  private 
  def set_location_type_params 
    params.require(:location_type).permit(:location_type, :comment)
  end

  def set_location_type 
    @location_type = LocationType.find(params[:id])
  end
end