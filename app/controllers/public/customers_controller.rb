class Public::CustomersController < ApplicationController

  def my_page
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end


  def unsubscribe
    @customer = current_customer
    #論理削除の方法
    @customer.update(is_unsubscribed: true)
      #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end




  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_number, :address, :phone_number, :is_unsubscribed)
  end


end
