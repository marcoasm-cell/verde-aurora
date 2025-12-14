class Admin::ProductsController < Admin::ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    params[:product][:status] = false if !params[:status].present?
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Produto criado com sucesso"
      redirect_to admin_products_path
    else
      flash[:danger] = "Erro ao criar produto"
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    params[:product][:status] = false if !params[:status].present?
    if @product.update(product_params)
      flash[:success] = "Produto atualizado com sucesso"
      redirect_to admin_products_path
    else
      flash[:danger] = "Erro ao atualizar produto"
      render :edit
    end
  end

  def product_params
    params.require(:product).permit(:status, :name, :description, :price, :category_id,  images: [] )
  end
end
