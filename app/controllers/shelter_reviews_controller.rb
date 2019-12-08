class ShelterReviewsController < ApplicationController
  def new 
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    review = @shelter.shelterReviews.new(shelter_review_params)

    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = "Artist not created: Required information missing."
      render :new
    end
  end

  private
    def shelter_review_params
      params.permit(:title, :rating, :review, :photo)
    end
end