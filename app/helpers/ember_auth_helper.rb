module EmberAuthHelper
  def login_from_token!
    puts 'in token login'
    if params[:auth_token].present?
      user = User.where(:authentication_token => params[:auth_token]).first
      raise "no user for token" unless user
      sign_in user
    end
  end
  def authenticate_ember_user!
    login_from_token!
    authenticate_user!
  end
end