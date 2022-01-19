class CreateRecommends < ActiveRecord::Migration[6.1]
  def change
    create_table :recommends do |t|
      t.string :status

      t.timestamps
    end
  end
end
