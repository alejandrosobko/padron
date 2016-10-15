class AddWorkableDaysToWorkCalendar < ActiveRecord::Migration
  def change
    add_reference :workable_days, :work_calendar, index: true, foreign_key: true
  end
end
