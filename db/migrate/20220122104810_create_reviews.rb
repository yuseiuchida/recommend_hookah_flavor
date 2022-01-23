class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :flavor, foreign_key: true
      t.integer :star, null: false
      t.text :comment
      t.integer :good

      t.timestamps
    end
  end
end
