class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?


  private


  def configure_sign_up_params
    if resource_class == Teacher
    devise_parameter_sanitizer.permit(:sign_up, keys: [:teach_content, :teach_detail, :teacher_history, :nickname, :image])
    end
  end

end