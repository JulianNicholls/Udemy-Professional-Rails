class ReviewsController < ApplicationController
  before_action :require_user_or_admin, only: :destroy

  def create
    @review = current_user.reviews.build review_params

    if @review.save
      flash[:success] = 'Your Review has been Saved Successfully'
    else
      flash[:danger] = "Your review wasn't long enough to save"
    end

    redirect_to :back
  end

  def destroy
    Review.find params[:id].destroy
    flash[:success] = 'The Review has been deleted Successfully'
    redirect_to :back
  end

  private

    def review_params
      params.require(:review).permit :recipe_id, :rating, :body
    end

    def require_user_or_admin
      return if current_user?(@review.chef) || current_user.admin?

      flash[:danger] = 'You can only update your own reviews'
      redirect_to recipes_path
    end
end
