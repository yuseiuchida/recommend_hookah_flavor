class CreateRecommends < ActiveRecord::Migration[6.1]
  def change
    create_table :recommends do |t|
      t.string :taste, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
