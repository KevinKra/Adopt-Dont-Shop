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

  def edit
    @shelter = Shelter.find(params[:shelter_id])
    @review = ShelterReview.find(params[:review_id])
  end

  def update
    @review = ShelterReview.find(params[:review_id])
    @shelter = @review.shelter

    if @review.update(shelter_review_params)
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash.now[:error] = "Unable to update review: missing required fields"
      render :edit
    end
  end

  private
    def shelter_review_params
      params.permit(:title, :rating, :review, :photo)
    end
end