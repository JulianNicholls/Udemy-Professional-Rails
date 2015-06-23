class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end
end
