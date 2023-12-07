class CreateCustomerDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
