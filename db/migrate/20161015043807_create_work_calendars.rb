class CreateWorkCalendars < ActiveRecord::Migration
  def change
    create_table :work_calendars do |t|

      t.timestamps null: false
    end
  end
end
