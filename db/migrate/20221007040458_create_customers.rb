class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.boolean :active_flag, default: true

      t.timestamps
    end
  end
end
