get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/register' do
  erb :register
end

get '/logeado' do
  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end

post '/submit' do
  user_email = params[:name]
  user_pass = params[:pass]
  #Hacer la condicion para ver que me regresa el metodo
  redirect to '/logeado'
end
