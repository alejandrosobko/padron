require 'rails_helper'

RSpec.describe WorkableDay, type: :model do
  describe 'new workable day' do
    it 'should not can saves an empty workable day' do
      workable_day = WorkableDay.new
      expect(workable_day.save).to eq false
    end

    it 'should can saves a new workable day with workable hours' do
      hours = [build(:workable_hour_morning), build(:workable_hour_afternoon)]
      workable_day = WorkableDay.new({day: 'Lunes', workable_hours: hours})

      expect(workable_day.save).to eq(true)
    end
  end
end
