class CreateCrateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :crate_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.references :crate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
