class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :customer_id
      t.string :address_id
      t.string :charge_id
      t.string :shopify_order_id
      t.string :shopify_order_number
      t.datetime :created_at
      t.datetime :scheduled_at
      t.datetime :processed_at
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
