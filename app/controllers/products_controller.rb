class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @product.increment!(:views_count)
    @product_categories = @product.product_categories.includes(:category)
    @related_products = Product.joins(:product_categories)
      .where("product_categories.category_id IN (#{@product.product_categories.pluck(:category_id).join(",")})").where.not(id: @product.id)
    @colors = Color.all
    @fragances = Fragance.all
  end
end
