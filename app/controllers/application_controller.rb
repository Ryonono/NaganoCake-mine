class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  before_action :configure_customerpermitted_parameters, if: :devise_controller?
  
  #before_action :correct_admin
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
  # ずっとログインができず、どこにエラーがあるのか分からないまあ２ヶ月間放置してしまっていたが、rails sでAdmin.allで検索をかけた時、passwordが書いてなかった
  
  #他の生徒さんで、同じくCompleted 401 Unauthorized inというエラーが出ていて、registrations/new.html.erbのmodelを@customres → @customerに変更するとうまくいった人もいたので、そこも見ていけたらより生徒対応の幅が広がる
  
  def configure_customerpermitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :address, :phone_number])
  end
  
  # def correct_admin
  #   devise_parameter_sanitizer.permit :sign_in, keys: [:email, :encrypted_password]
  # end

end
