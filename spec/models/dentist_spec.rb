require 'rails_helper'

RSpec.describe Dentist, :type => :model do

  describe 'empty dentist' do
    it 'should not can save an empty dentist' do
      dentist = build(:dentist)
      expect(dentist.save).to be false
    end
  end

  describe 'empty dentist' do
    let(:visit) { build(:visit, visitor: build(:visitor)) }
    let(:dentist) { build(:dentist, visits: [visit], work_calendar: WorkCalendar.new) }

    it 'should can save a dentist with visits' do
      expect(dentist.save).to be true
    end
  end

  describe 'with work calendar' do
    let(:visit) { build(:visit, visitor: build(:visitor)) }
    let(:dentist) { build(:dentist, visits: [visit], work_calendar: WorkCalendar.new) }

    it 'should can save a dentist with a lot of workable days' do
      hours = [build(:workable_hour_morning), build(:workable_hour_afternoon)]
      days = [build(:workable_day_monday, workable_hours: hours), build(:workable_day_tuesday, workable_hours: hours)]
      dentist.work_calendar.workable_days = days

      expect(dentist.save).to be true
      expect(dentist.work_calendar.workable_days.first.day).to eq 'Monday'
      expect(dentist.work_calendar.workable_days[1].day).to eq 'Tuesday'
    end
  end

end
