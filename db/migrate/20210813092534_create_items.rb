class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.boolean :is_released, null: false, default: true

      t.timestamps
    end
  end
end
