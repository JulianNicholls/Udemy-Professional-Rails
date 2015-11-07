# Controller for login
class LoginsController < ApplicationController
  def new
  end

  def create
    user = Chef.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in_user user
      flash[:success] = 'You are signed in.'
      redirect_to recipes_path
    else
      flash.now[:danger] = 'Your email or password were not recognised.'
      render :new
    end
  end

  def destroy
    log_out_user if logged_in?
    flash[:success] = 'You have signed out.'
    redirect_to root_path
  end
end
