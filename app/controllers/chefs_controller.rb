class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 3)
  end

  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      flash[:success] = 'Your Account was Registered Successfully'
      log_in_user @chef
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chef.update chef_params
      flash[:success] = 'Your Profile was Updated Successfully'
      redirect_to @chef
    else
      render :edit
    end
  end

  private

    def chef_params
      params.require(:chef).permit :name, :email, :profile, :password,
                                   :password_confirmation
    end

    def set_chef
      @chef = Chef.find params[:id]
    end

    def require_same_user
      return if current_user? @chef

      flash[:danger] = 'You can only edit your own profile.'
      redirect_to root_path
    end
end
