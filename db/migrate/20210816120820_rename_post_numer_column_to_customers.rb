class RenamePostNumerColumnToCustomers < ActiveRecord::Migration[5.0]
  def change
    rename_column :customers, :post_numer, :post_number
  end
end
