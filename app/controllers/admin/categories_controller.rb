class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Categoria criada com sucesso"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Erro ao criar categoria"
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Categoria atualizada com sucesso"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Erro ao atualizar categoria"
      render :edit
    end
  end

  def category_params
    params.permit(:name)
  end
end
