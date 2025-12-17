class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.where(status: true).order(id: :desc)
  end
end