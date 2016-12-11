class AddWorkCalendarToInstitute < ActiveRecord::Migration
  def change
    add_reference :work_calendars, :institute, index: true, foreign_key: true
  end
end
