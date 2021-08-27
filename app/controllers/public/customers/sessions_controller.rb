# frozen_string_literal: true

class Public::Customers::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_user
    #入力している情報はlast_name,first_nameなので、emailでは意味がない？　→ その通りだった！！　→　試行錯誤の末、これで基本的にはうまくいく（一旦これでOK）
    #姓名があっていてパスワードが違う時、姓名がまだ退会してない人で、パスワードが退会した人のものだった時　・・・エラーメッセージが出ない、
    @customer = Customer.find_by(last_name: params[:customer][:last_name], first_name: params[:customer][:first_name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.active_for_authentication? == false
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "名前かパスワードが間違っています。正しい情報を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
