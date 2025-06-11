class SessionsController < ApplicationController
  def new
  end
  #vehicles_admin_dashboard_path
  def create
    if params[:password] == Rails.application.credentials.admin_password.to_s
      session[:admin] = true
      redirect_to vehicles_path, notice: "Bienvenido, gerente"
    else
      flash.now[:alert] = "Contraseña incorrecta"
      render :new
    end
  end

  def destroy
    session.delete(:admin)
    redirect_to root_path, notice: "Sesión cerrada"
  end
end
