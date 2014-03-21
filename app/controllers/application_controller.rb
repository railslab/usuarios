class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :error, :success, :warning, :ok, :info
  helper_method :logado?, :usuario_logado

  private

  def usuario_logado
    Usuario.find_by_id session_id
  end

  def logado?
    session_id.present?
  end

  def session_id
    session[session_id_key]
  end

  def session_id_key
    :id
  end
end
