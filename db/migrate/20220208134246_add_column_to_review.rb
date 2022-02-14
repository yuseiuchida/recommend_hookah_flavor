class AddColumnToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :good, :integer
  end
end
