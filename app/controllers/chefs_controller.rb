class ChefsController < ApplicationController
  def show
    # require 'pry' ; binding.pry
    @chef = Chef.find(params[:id])
  end
end