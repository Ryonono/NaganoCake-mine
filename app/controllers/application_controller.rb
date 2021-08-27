class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  #ここを追加

  def after_sign_in_path_for(resource)
    #条件分岐
    case resource
    when Admin
      admin_path
    when Customer
      customers_my_page_path
    end
  end

  protected

  #ここがdevise機能のストロングパラメーター（ここに書いておいたものは、新規登録時に使用するもの)なので、emailはこっちで示す
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [ :last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :address, :phone_number, :email]
  end


end
