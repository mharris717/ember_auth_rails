class User < ActiveRecord::Base
  include UserMod
  devise :token_authenticatable
  before_save :ensure_authentication_token
end