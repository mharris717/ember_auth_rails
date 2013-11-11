class EmberUsersController < ApplicationController
  before_filter :authenticate_user!

  def get_user_by_ident(ident)
    raise "no user ident" unless ident.present?
    if ident.to_s.length >= 10
      User.where(:authentication_token => ident).first
    else
      User.find(ident)
    end
  end

  def show
    Rails.logger.info "EmberUsers#show getting user #{params[:id]}"
    @user = get_user_by_ident(params[:id])
    raise "no user found for #{params[:id]}" unless @user
    render :json => @user
  end

  def index
    raise "no auth token" unless params[:auth_token].present?
    @users = User.where(:authentication_token => params[:auth_token])
    render :json => @users, :root => "users"
  end

  def update
    pu = params[:user] || {}
    @user = get_user_by_ident(params[:id])
    new_password = pu[:password]
    raise "no password" unless new_password.present?
    @user.password = new_password
    if @user.save
      render :json => @user
    else
      render :json => {:error => "Password " + @user.errors.values.flatten.join(", ")}
    end
  end
end