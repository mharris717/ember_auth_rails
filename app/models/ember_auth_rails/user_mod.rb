module EmberAuthRails
  module UserMod
    extend ActiveSupport::Concern

    included do
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable,
             :token_authenticatable
      
      validates_presence_of :email

      before_save :ensure_authentication_token

      attr_accessible :email, :password
    end
  end
end