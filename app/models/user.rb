#Usar a Bcrypt para que podamos guardar las contraseñas
include BCrypt
class User < ActiveRecord::Base
  # Remember to create a migration!
  #Validaciones para que el email sea unico y que la contrase 
  #sea requerida
  validates :email, uniqueness: true
  validates :email, :password, presence: true
  #Poner los metodos para crear la contraseña y para la autenticacion
  #Estos dos metodos son de la clase bcrypt para que se genere el hash con la contraseña
  #Get para contraseña
  def password
    @password ||= Password.new(password_digest)
  end
  #Set para contraseña
  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  #Metodo de autenticacion
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

  
end
