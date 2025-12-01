class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @product.increment!(:views_count)
    @related_products = Product.where(category_id: @product.category_id).where.not(id: @product.id)
    @colors = Color.all
    @fragances = Fragance.all
  end
end
