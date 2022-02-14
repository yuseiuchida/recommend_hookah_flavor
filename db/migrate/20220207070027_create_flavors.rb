class CreateFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :flavors do |t|
      t.string :name
      t.string :flavor_element_base
      t.text :body
      t.float :sweet
      t.float :refresh
      t.float :relax

      t.timestamps
    end
  end
end
