get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @message = session[:message]
  erb :index
end

#Vista para renderear a registrarser
get '/register' do
  erb :register
end

#Vista para ir al login
get '/logeado' do
  erb :login
end

#Vista para cerrar sesion
get '/logout' do
  session.clear
  erb :index
end

#Posto para ingresar a la session
post '/submit' do
  user_email = params[:email]
  user_pass = params[:pass]
  #Hacer la condicion para ver que me regresa el metodo
  user = User.authenticate(user_email, user_pass)
  p "POOPO" * 80
  p user
  if user
    session[:user_id] = user.id
    redirect to '/logeado'
  else
    session[:message] = "No estas registrado"
    redirect to '/'
  end
end

#post para registrarse
post '/register' do
  user_name = params[:nombre]
  user_email = params[:email]
  user_pass = params[:pass]
  p User.create(name: user_name, email: user_email, password: user_pass)
  redirect to '/'
end