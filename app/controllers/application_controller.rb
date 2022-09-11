class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :nickname, :email, :password])
  end

   #引数はuserとかでもオッケー
  def after_sign_up_path_for(resource)
    public_reviews_path
  end

  def after_sign_in_path_for(resource)
     public_reviews_path
  end

end
