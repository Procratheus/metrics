class User < ActiveRecord::Base
  # Validations
  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, 
         :omniauth_providers => [:facebook, :twitter]

end
