# Controller for static pages, i.e. home
class PagesController < ApplicationController
  def home
    redirect_to recipes_path if logged_in?
  end
end
