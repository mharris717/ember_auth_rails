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
    puts 'here in session create'
    login_from_token!
    resource = current_user
    raise "no user" unless current_user
    render :json => {:auth_token => current_user.authentication_token, :user_id => current_user.id, :success => true}
      #:redirect => stored_location_for(scope) || after_sign_in_path_for(current_user)}
  end

  def destroy
    raise "no user" unless current_user
    #raise "emails don't match" unless current_user.email == params[:user][:email]
    puts "logging out #{current_user.email} | #{params.inspect}"
    res = sign_out current_user
    puts "current_user after sign out | #{res.inspect} | #{current_user.inspect}"
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