class Admin::PasswordResetsController < Admin::ApplicationController
  skip_before_action :require_user_logged_in!
  
  def new
  end

  def edit
    @user = User.find_signed(params[:id], purpose: 'password_reset')

    if !@user.present?
      flash[:danger] = "Link inválido ou expirado"
      return redirect_to new_session_path
    end
  end 


  def create
    @user = User.find_by_email(params[:email])
    if @user.present?
      flash[:success] = "Email enviado com sucesso"
      ApplicationMailer.delay.recover_email(@user)
      redirect_to new_session_path
    else
      flash[:danger] = "Email inválido"
      redirect_to new_password_reset_path
    end
  end
  
  def update
    @user = User.find_signed!(params[:id], purpose: 'password_reset')

    if !@user.present?
      flash[:danger] = "Link inválido ou expirado"
      return redirect_to new_session_path
    end
    if params[:password] != params[:password_confirmation]
      flash[:danger] = "As palavras-passe não coincidem"
      return redirect_to request.referrer 
    end
    if @user.update(password: params[:password])
      flash[:success] = "Palavra-passe alterada com sucesso"
      redirect_to new_session_path
    else 
      flash[:danger] = @user.errors.full_messages.join("<br>")
      redirect_to new_password_reset_path
    end
  end

end