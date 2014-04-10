class Console::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user_is_admin

  protected

  def current_user_is_admin
    unless current_user && current_user.admin
      flash[:notice] = "You must be administrator to access the admin portion of this website"
      redirect_to alerts_url
    end
  end
end