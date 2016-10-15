class AddWorkCalendarToDentist < ActiveRecord::Migration
  def change
    add_reference :work_calendars, :dentist, index: true, foreign_key: true
  end
end
