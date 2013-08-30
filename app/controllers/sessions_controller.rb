class SessionsController < Devise::SessionsController
  def index
    render :text => "Sup Index"
  end
  def show
    render :text => "Sup Show"
  end

  before_filter "setup_user_params!"

  def setup_user_params!
    if params[:email]
      params[:user] ||= {}
      params[:user][:email] ||= params[:email]
      params[:user][:password] ||= params[:password]
    end
  end
  def create
    authenticate_user!
    resource = current_user
    if current_user
      render :json => {:auth_token => current_user.authentication_token, :user_id => current_user.id, :success => true}
    else
      pu = params[:user] || {}
      render :status => 404, :json => {:status => "errorWHEEE", :email => pu[:email], :password => pu[:password]}
    end
  end

  def destroy
    raise "no user" unless current_user
    res = sign_out current_user
    render :json => {:success => true}
  end
 
  def failure
    raise 'in failure'
    return render:json => {:success => false, :errors => ["Login failed."]}
  end

  def options
    head :ok
  end
end