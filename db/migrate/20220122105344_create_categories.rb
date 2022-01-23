class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.string :fruit, null: false
      t.string :sweet, null: false
      t.string :refresh, null: false
      t.string :alcohol, null: false

      t.timestamps
    end
  end
end
