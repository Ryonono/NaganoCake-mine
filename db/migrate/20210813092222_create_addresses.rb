class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :post_number, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
