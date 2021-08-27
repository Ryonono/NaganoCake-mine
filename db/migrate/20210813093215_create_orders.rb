class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.string :post_number, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :send_fee, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
