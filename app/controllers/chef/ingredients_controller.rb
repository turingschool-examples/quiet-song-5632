class Chef::IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:format])
  end
end