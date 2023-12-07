class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :email
      t.decimal :total_amout
      t.string :status

      t.timestamps
    end
  end
end
