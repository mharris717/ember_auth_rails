class EmberUsersController < ApplicationController
  def show
    Rails.logger.info "EmberUsers#show getting user #{params[:id]}"
    raise "no user id" unless params[:id].present?
    if params[:id].to_s.length >= 10
      @user = User.where(:authentication_token => params[:id]).first
    else
      @user = User.find(params[:id])
    end
    raise "no user found for #{params[:id]}" unless @user
    render :json => @user
  end
end