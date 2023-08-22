class AddNameToCrates < ActiveRecord::Migration[7.0]
  def change
    add_column :crates, :name, :string
  end
end
