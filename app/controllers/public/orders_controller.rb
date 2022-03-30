class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @order.send_fee = 800
    @order.total_price = get_subtotal + @order.send_fee
    @order.order_status = 0
    get_order_address
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_thanks_path
    else
      @cart_items = current_customer.cart_items.all
      render :confirm
    end
  end
  
  def complete
  end
  
  def index
  end
  
  def show
  end
  
  
  private
  
  def get_subtotal
    @subtotal = 0
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @subtotal = cart_item.item.price * cart_item.amount
    end
    return @subtotal
  end
  
  def get_order_address
    @order = Order.new
    #address_optionは実際のデータベースには存在しない仮のカラム名なので、parameterとして直接持ってくる必要性がある
    #かつ、等式記号の右側の数値は0というIntegerではなく、文字列を入れる必要性がある（おそらく、数値で入れると計算しか行うことができず、同じか違うかを等式で判断することができない）
    if params[:order][:address_option] == "0"
      @order.post_number = current_customer.post_number
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find_by(params[:address_id])
      @order.post_number = @address.post_number
      @order.address = @address.address
      @order.name = @address.name
    end
  end
    
    def order_params
      params.require(:order).permit(:customer_id, :payment_method, :order_status, :post_number, :address, :name, :send_fee, :total_price)
    end
    
end

