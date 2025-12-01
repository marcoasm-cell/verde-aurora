class ContactsController < ApplicationController
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
      redirect_to request.referrer
    else
      flash[:danger] = "Erro ao criar contacto"
      redirect_to request.referrer
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Contacto atualizado com sucesso"
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def contact_params
    params.permit(:name, :email, :message, :phone, :product_id, :color_id, :fragance_id)
  end
end
