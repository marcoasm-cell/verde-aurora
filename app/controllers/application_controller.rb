class ApplicationController < ActionController::Base
  def index 
    @products = Product.all.order(id: :desc)
  end
end
