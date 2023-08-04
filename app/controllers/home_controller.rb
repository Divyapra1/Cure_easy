class HomeController < ApplicationController
  def index
    @category=Category.all
  end
  def show
    category=Category.find(params[:id])
    @subcategory=category.sub_categories
  end

  
end
