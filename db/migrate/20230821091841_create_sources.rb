class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
        t.references :remix, foreign_key: { to_table: :songs }
        t.references :source, foreign_key: { to_table: :songs }
        t.timestamps
    end
  end
end
