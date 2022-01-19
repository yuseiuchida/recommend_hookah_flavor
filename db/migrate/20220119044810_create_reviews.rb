class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comment

      t.timestamps
    end
  end
end
