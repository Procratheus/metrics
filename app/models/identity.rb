class Identity < ActiveRecord::Base
  belongs_to :user

  # Validations
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  # Create Indentities for each user
  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

end
