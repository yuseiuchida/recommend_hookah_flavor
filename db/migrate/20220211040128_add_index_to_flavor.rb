class AddIndexToFlavor < ActiveRecord::Migration[6.1]
  def change
    add_index :flavors, [:name], unique: true
  end
end
