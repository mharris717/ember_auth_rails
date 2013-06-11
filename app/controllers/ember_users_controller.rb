class EmberUsersController < ApplicationController
  def show
    Rails.logger.info "EmberUsers#show getting user #{params[:id]}"
    @user = User.find(params[:id])
    render :json => @user
  end
end