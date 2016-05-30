#Helpers para que sea mas facil saber que usuario esta en la session
helpers do
  #Metodo para saber que usuario es
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  #Metodo para saber si esta logeado
  def logged_in?
    !current_user.nil?
  end
end