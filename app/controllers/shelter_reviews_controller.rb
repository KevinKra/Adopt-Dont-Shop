class ShelterReviewsController < ApplicationController
  def new 
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:id])
    shelter.shelterReviews.create(shelter_review_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  private
    def shelter_review_params
      params.permit(:title, :rating, :review, :photo)
    end
end