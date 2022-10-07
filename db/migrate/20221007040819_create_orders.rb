class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date, null: false
      t.references :customer, null: false, foreign_key: true
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
