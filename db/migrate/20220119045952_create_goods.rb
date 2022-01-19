class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.integer :count

      t.timestamps
    end
  end
end
