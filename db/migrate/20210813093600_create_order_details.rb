class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :production_status, null: false, default: 0
      t.integer :amount, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
