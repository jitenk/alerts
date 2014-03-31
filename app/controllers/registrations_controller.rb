class RegistrationsController < Devise::RegistrationsController

  def create
      if params[:agree] && verify_recaptcha
        super
      else
        build_resource(sign_up_params)
        clean_up_passwords(resource)
        if params[:agree].nil? && !verify_recaptcha
          flash.now[:alert] = "You did not agree and missing captcha"
        elsif params[:agree].nil?
          flash.now[:alert] = "You did not agree"
        elsif !verify_recaptcha
          flash.now[:alert] = "captcha not correct"
        end
        flash.delete :recaptcha_error
        render :new
      end
  end

end