class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :like]
  before_action :require_user, except: [:index, :show, :like]
  before_action :require_user_like, only: [:like]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @recipes = Recipe.paginate page: params[:page], per_page: 4
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Your Recipe was Created Successfully"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update recipe_params
      flash[:success] = "Your Recipe was Updated Successfully"
      redirect_to @recipe
    else
      render :edit
    end
  end


  def like
    like = Like.create(like: params[:like], recipe: @recipe, chef: current_user)

    if like.valid?
      flash[:success] = "Your selection was successful"
    else
      flash[:danger] = "You can only vote on a recipe once"
    end

    redirect_to :back
  end

  private

    def recipe_params
      params.require(:recipe).permit :name, :summary, :description, :picture, style_ids: [], ingredient_ids: []
    end

    def set_recipe
      @recipe = Recipe.find params[:id]
    end

    def require_user_like
      unless logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to :back
      end
    end

    def require_same_user
      unless current_user? @recipe.chef
        flash[:danger] = "You can only edit your own recipes"
        redirect_to recipes_path
      end
    end
end
