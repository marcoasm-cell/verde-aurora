class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_user_logged_in!, only: [:new, :create]

  def new
  end
  
  def create
    user = User.find_by("email = ? AND status = true", params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:success] = "Login realizado com sucesso"
      return redirect_to admin_products_path
    else
      flash[:danger] = "Utilizador ou senha inválidos"
      return redirect_to new_admin_session_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    return redirect_to new_admin_session_path
  end
end