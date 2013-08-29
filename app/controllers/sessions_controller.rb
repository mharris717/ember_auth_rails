def print_backtrace
  raise 'foo'
rescue => exp
  puts exp.backtrace[1..-1].join("\n")
end

def raise_backtrace
  raise 'foo'
rescue => exp
  raise exp.backtrace[1..35].join("\n")
end

class Symbol
  def split(*args)
    raise_backtrace
  end
end

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
      render :status => 404, :json => {:status => "error", :email => params[:user].andand[:email], :password => params[:user].andand[:password]}
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