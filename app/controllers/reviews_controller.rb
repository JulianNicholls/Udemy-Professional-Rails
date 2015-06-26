class ReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    @review.chef = current_user

    if @review.save
      flash[:success] = "Your Review has been Saved Successfully"
    else
      flash[:danger] = "Your review wasn't long enough to save"
    end

    redirect_to :back
  end

  private

    def review_params
      params.require(:review).permit :recipe_id, :rating, :body
    end
end
