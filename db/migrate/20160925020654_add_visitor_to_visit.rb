class AddVisitorToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :visitor, index: true, foreign_key: true
  end
end
