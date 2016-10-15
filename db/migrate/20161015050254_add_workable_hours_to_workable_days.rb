class AddWorkableHoursToWorkableDays < ActiveRecord::Migration
  def change
    add_reference :workable_hours, :workable_day, index: true, foreign_key: true
  end
end
