class Admin::ContactsController < Admin::ApplicationController
  def index
    @contacts = Contact.all.order(created_at: :desc)
  end

  def new
    @contact = Contact.new
    @categories = Category.all
  end

  def edit
    @contact = Contact.find(params[:id])
    @categories = Category.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contacto criado com sucesso"
      redirect_to admin_contacts_path
    else
      flash[:danger] = "Erro ao criar contacto"
      render :new
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Contacto atualizado com sucesso"
      redirect_to admin_contacts_path
    else
      flash[:danger] = "Erro ao atualizar contacto"
      render :edit
    end
  end

  def contact_params
    params.permit(:name, :email, :message, :phone, :product_id, :color_id)
  end
end
