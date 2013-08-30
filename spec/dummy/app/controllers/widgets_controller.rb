class WidgetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @widgets = Widget.where(:user_id => current_user.id)
    render :json => @widgets
  end
end
