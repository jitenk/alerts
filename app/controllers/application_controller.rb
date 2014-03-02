class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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

end
