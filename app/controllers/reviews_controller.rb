class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :require_user_or_admin, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    @review.update review_params
    binding.pry
  end

  def destroy
    @review.destroy
    flash[:success] = "The Review has been Deleted Successfully"
    redirect_to :back
  end

  private

    def review_params
      params.require(:review).permit :recipe_id, :rating, :body
    end

    def set_review
      @review = Review.find params[:id]
    end

    def require_user_or_admin
      return if current_user?(@review.chef) || current_user.admin?

      flash[:danger] = "You can only update your own reviews"
      redirect_to recipes_path
    end
end
