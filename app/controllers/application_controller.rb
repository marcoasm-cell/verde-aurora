class ApplicationController < ActionController::Base
  def index 
    @products = Product.where(status: true).order(id: :desc)
  end
end
