class CreateAims < ActiveRecord::Migration[6.1]
  def change
    create_table :aims do |t|
      t.integer :option1
      t.integer :option2
      t.integer :option3
      t.integer :option4
      t.integer :option5

      t.timestamps
    end
  end
end
