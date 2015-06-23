class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      flash[:success] = "Your Signup was Successful"
      redirect_to chefs_path
    else
      render :new
    end
  end

  def show

  end

  private

    def chef_params
      params.require(:chef).permit :name, :email, :profile, :password, :password_confirmation
    end

end
