class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email params[:email]

    if usuario.try :authenticate, params[:password]
      session[session_id_key] = usuario.id
      redirect_to root_path, success: "Bem Vindo, #{usuario.nome}!"
    else
      redirect_to login_path, error: "Email ou Senha Inválidos!"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Usuário deslogado com sucesso!"
  end
end
