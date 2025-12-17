class ApplicationController < ActionController::Base
  def index 
    @products = Product.where(status: true).order(id: :desc)
    @categories = Category.where(status: true).includes(:products).joins(:products).order(name: :asc)
  end
end
