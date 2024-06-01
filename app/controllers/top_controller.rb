class TopController < ApplicationController
  def index
    @categories = Category.all
    
  end
end
