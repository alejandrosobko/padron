class DeleteVisitToVisitor < ActiveRecord::Migration
  def change
    remove_index :visitors, :visit_id
    remove_column :visitors, :visit_id
  end
end
