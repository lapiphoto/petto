class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  before_action :set_search
  def set_search
    @search = Pet.ransack(params[:q])
    
    # @search_tag = Tag.ransack(params[:q]) 
    #ransackメソッド推奨
    @search_pets = @search.result.all
  end
end
