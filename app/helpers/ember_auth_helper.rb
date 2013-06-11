module EmberAuthHelper
  def login_from_token!
    #puts 'in token login'
    if params[:auth_token].present?
      user = User.where(:authentication_token => params[:auth_token]).first
      raise "no user for token" unless user
      Rails.logger.info "Logging in user #{user.id} #{user.email} with auth token #{params[:auth_token]}"
      sign_in user
    end
    true
  end
  def authenticate_ember_user!
    login_from_token!
    authenticate_user!
  end
end