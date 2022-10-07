class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.integer :duration
      

      t.timestamps
    end
  end
end
