class HomeController < ApplicationController
  def index
    @category=Category.all
  end
  def show
     category=Category.find(params[:id])
     @subcategory=category.sub_categories
  end
    
  def display
     sub_category=SubCategory.find(params[:id])
     @catalouge=sub_category.catalogues
  end
  def discription
    @disc=Catalogue.find(params[:id])  
  end

  
    
end
