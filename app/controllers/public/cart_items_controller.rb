class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total_price = get_total_price
  end

  def create

    #現状、item_idの渡し方がわからない
    # →ずっとこの書き方を試していて、何が違うのかがわからなかったが、原因はhidden_fieldの書き方が誤っていたことだったので、この記述で問題なかった
    # @item = Item.find(params[:cart_item][:item_id])

      # (item_id: params[:cart_item][:item_id])この書き方を覚える　→item_idはcart_itemモデルの中のitem_idであるということ
      # なぜかこの部分でエラーが出る
      @cart_item = current_customer.cart_items.find_by(params[:cart_item][:item_id])
      if @cart_item.present?
        @cart_item.amount += @cart_item(params[:cart_item][:amount]).to_i
        @cart_item.save
      else
        @cart_item = CartItem.new(cart_item_params)
        @item = Item.find(params[:cart_item][:item_id])
        @cart_item.customer = current_customer
        @cart_item.item_id = @item.id
        @cart_item.save
      end
      redirect_to cart_items_path

  end


  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    # current_customerに設定しないと、他人のデータも含めて全てが削除されてしまう？！
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to items_path
  end


  private

    # 合計金額の表示方法がわからない
    def get_total_price
      #@item = Item.find(params[:cart_item][:item_id])
      @cart_items = CartItem.all
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * cart_item.item.price
        for subtotal in @cart_items
          #total_price = subtotal + subtotal
        end
      end
      #puts total_price
    end



  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
