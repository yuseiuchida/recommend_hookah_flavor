class CreateFlavorCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :flavor_categories do |t|
      t.references :flavor, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
