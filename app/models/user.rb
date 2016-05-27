class User < ActiveRecord::Base
  # Remember to create a migration!
  #Validaciones para que el email sea unico y que la contrase 
  #sea requerida
  validates :email, uniqueness: true
  validates :email, :password, presence: true
  #Poner los metodos de locomotion para crear el pass y para la autenticacion
  
end
