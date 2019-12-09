class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.shelterReviews.all
  end

  def new
  end
  
  def create
    shelter = Shelter.create(shelter_params)
    redirect_to "/shelters"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  def index_pets
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  private
    def shelter_params
      params.permit(:title, :address, :city, :state, :zip)
    end
end