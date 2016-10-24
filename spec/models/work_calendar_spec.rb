require 'rails_helper'

RSpec.describe WorkCalendar, type: :model do
  describe 'new work calendar' do
    it 'should can saves an empty work calendar' do
      work_calendar = WorkCalendar.new
      expect(work_calendar.save).to eq(true)
    end

    it 'should can saves a new work calendar with workable days and workable hours' do
      hours = [build(:workable_hour_morning), build(:workable_hour_afternoon)]
      days = [build(:workable_day_monday, workable_hours: hours), build(:workable_day_tuesday, workable_hours: hours)]

      work_calendar = WorkCalendar.new({workable_days: days})
      expect(work_calendar.save).to eq(true)
    end

    it 'should not can saves a new work calendar with equals days' do
      hours = [build(:workable_hour_morning), build(:workable_hour_afternoon)]
      days = [build(:workable_day_monday, workable_hours: hours), build(:workable_day_monday, workable_hours: hours)]

      work_calendar = WorkCalendar.new({workable_days: days})
      expect{work_calendar.save}.to raise_error(RuntimeError)
    end

  end
end
