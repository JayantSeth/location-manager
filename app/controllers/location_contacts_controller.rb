class LocationContactsController < ApplicationController 
  before_action :set_location_contact, only: [:show, :update, :destroy, :edit]

  def new 
    @location_contact = LocationContact.new 
  end

  def create 
    @location_contact = LocationContact.new(set_location_contact_params) 
    if @location_contact.save
      flash[:notice] = "Location Contact is successfully created" 
      redirect_to location_contacts_path
    else
      render 'new'
    end
  end
  
  def edit 
  end 

  def show 
  end

  def update 
    if @location_contact.update(set_location_contact_params)
      flash[:notice] = "Location Contact was successfully updated"
      redirect_to @location_contact  
    else
      render 'edit'
    end
  end

  def destroy 
    @location_contact.destroy 
    flash[:notice] = "Location Contact was successfully deleted"
    redirect_to location_contacts_path  
  end

  def index 
    @location_contacts = LocationContact.all 
  end

  private 
  def set_location_contact_params 
    params.require(:location_contact).permit(:name, :number, :email, :comment)
  end

  def set_location_contact 
    @location_contact = LocationContact.find(params[:id])
  end
end