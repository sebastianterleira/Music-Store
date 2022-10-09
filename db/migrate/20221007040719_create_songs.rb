class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.references :album, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
