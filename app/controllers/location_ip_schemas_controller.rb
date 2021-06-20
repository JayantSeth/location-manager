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
    ip = Ip.new(params["anything"][:ip])
    if ip.valid?
      location = LocationIpSchema.search_location(ip.ip) 
      if location 
        @location = location 
        respond_to do |format| 
          format.js { render partial: 'location_ip_schemas/location'}
        end
      else 
        respond_to do |format| 
          flash.now[:alert] = "Location for IP #{ip.ip} could not be found" 
          format.js { render partial: 'location_ip_schemas/location'}
        end
      end
    else
      @ip = ip
      respond_to do |format| 
        format.js { render partial: 'location_ip_schemas/location'}
      end
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