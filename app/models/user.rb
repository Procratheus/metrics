class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = "change@me" # sets the twitter users temporary e-mail
  TEMP_EMAIL_REGEX = /\Achange@me/ # evaluates the twitters users email to ensure they are not be signed-in with a temporary e-mail

  # Validations for log-in details
  validates_presence_of :name, :password, :email
  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, 
         :omniauth_providers => [:facebook, :twitter]

  def self.find_for_oauth(auth, signed_in_resource = nil)

    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user
    
    if user.nil?
      email_is_verified = auth.info.email && auth.info.verified
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.provider}",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end  

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
