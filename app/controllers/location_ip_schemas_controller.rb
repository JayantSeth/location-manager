class LocationIpSchemasController < ApplicationController 
  before_action :set_location_ip_schema, only: [:show, :update, :destroy, :edit]

  def new 
    @location_ip_schema = LocationIpSchema.new 
  end

  def create 
    @location_ip_schema = LocationIpSchema.new(set_location_ip_schema_params) 
    if @location_ip_schema.save
      flash[:notice] = "Location IP Schema is successfully created" 
      redirect_to location_ip_schemas_path
    else
      render 'new'
    end
  end
  
  def edit 
  end 

  def show 
  end

  def update 
    if @location_ip_schema.update(set_location_ip_schema_params)
      flash[:notice] = "Location IP Schema was successfully updated"
      redirect_to @location_ip_schema  
    else
      render 'edit'
    end
  end

  def destroy 
    @location_ip_schema.destroy 
    flash[:notice] = "Location IP Schema was successfully deleted"
    redirect_to location_ip_schemas_path  
  end

  def index 
    @location_ip_schemas = LocationIpSchema.all 
  end
  
  def search 
  end

  def find_location 
    ip = params["anything"][:ip] 
    location = LocationIpSchema.search_location(ip) 
    if location 
      @location = location 
      render 'search' 
    else 
      flash[:notice] = "Location for IP #{ip} could not be found" 
      render 'search' 
    end
  end

  private 
  def set_location_ip_schema_params 
    params.require(:location_ip_schema).permit(:network, :subnet, :comment, :location_id)
  end

  def set_location_ip_schema 
    @location_ip_schema = LocationIpSchema.find(params[:id])
  end
end