class AddColumnForFlavor < ActiveRecord::Migration[6.1]
  def change
    add_column :flavors, :score, :float
  end
end
