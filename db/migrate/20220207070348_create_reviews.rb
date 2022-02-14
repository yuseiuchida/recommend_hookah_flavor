class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :flavor, foreign_key: true
      t.float :star
      t.text :comment

      t.timestamps
    end
  end
end
