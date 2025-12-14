class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all.order(:status)
  end

  def new
    @order = Order.new
    relation_info
  end

  def edit
    @order = Order.find(params[:id])
    relation_info
  end

  def create
    params[:order][:status] = false if !params[:order][:status].present?
    @order = Order.new(order_params)

    if @order.save
      flash[:success] = "Encomenda criado com sucesso"
      redirect_to admin_orders_path
    else
      flash[:danger] = "Erro ao criar encomenda"
      relation_info
      render :new
    end
  end

  def relation_info
    @categories = Category.all
    @all_products = Product.all
    @colors = Color.all
    @fragances = Fragance.all
  end

  def update
    @order = Order.find(params[:id])
    params[:order][:status] = false if !params[:order][:status].present?
    if @order.update(order_params)
      flash[:success] = "Encomenda atualizada com sucesso"
      redirect_to admin_orders_path
    else
      flash[:danger] = "Erro ao atualizar encomenda"
      relation_info
      render :edit
    end
  end

  def order_params
    params.require(:order).permit(:status, :client_name, :client_email, :client_phone, :client_address, :price, :ports, 
      order_items_attributes: [:id, :product_id, :color_id, :fragance_id, :quantity, :_destroy])
  end
end
