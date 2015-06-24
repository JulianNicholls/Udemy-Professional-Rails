class ChefsController < ApplicationController

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 3)
  end

  def show
    @chef = Chef.find params[:id]
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      flash[:success] = "Your Account was Registered Successfully"
      log_in_user @chef
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find params[:id]
  end

  def update
    @chef = Chef.find params[:id]

    if @chef.update chef_params
      flash[:success] = 'Your Profile was Updated Successfully'
      redirect_to @chef
    else
      render :edit
    end
  end

  private

    def chef_params
      params.require(:chef).permit :name, :email, :profile, :password, :password_confirmation
    end
end
