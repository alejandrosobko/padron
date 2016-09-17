class DeleteOldTables < ActiveRecord::Migration
  def change
    drop_table   :items
    drop_table   :comments
    drop_table   :posts
  end
end
