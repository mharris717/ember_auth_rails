class SessionsController < Devise::SessionsController
  def index
    render :text => "Sup Index"
  end
  def show
    render :text => "Sup Show"
  end

  def create
    puts "IN AUTH CREATE"

    if params[:email]
      params[:user] ||= {}
      params[:user][:email] ||= params[:email]
      params[:user][:password] ||= params[:password]
    end

    resource = warden.authenticate!(:scope => resource_name, :recall => :failure)
    return sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource

    #token = rand(1000000000000000000000000).to_s
    #resource.auth_token = token
    #resource.save!
    return render :json => {:auth_token => resource.authentication_token, :user_id => resource.id, :success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end
 
  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
end