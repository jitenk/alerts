class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?
  layout :layout_by_resource

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  # this method will not show application layout on login screen
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  #accept additional attribute for user table
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :last_name, :first_name, :title, :agency_ori, :address1, :address2, :city, :state, :zip, :phone, :alt_phone, :fax, :admin, :approved)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :last_name, :first_name, :title, :agency_ori, :address1, :address2, :city, :state, :zip, :phone, :alt_phone, :fax, :admin, :approved)}
  end

end
