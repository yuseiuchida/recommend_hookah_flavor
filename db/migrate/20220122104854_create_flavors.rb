class CreateFlavors < ActiveRecord::Migration[6.1]
  def change
    create_table :flavors do |t|
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
