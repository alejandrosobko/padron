require 'rails_helper'

RSpec.describe WorkableHour, type: :model do
  describe 'new workable hour' do
    it 'should not can saves an empty workable hour' do
      workable_hour = WorkableHour.new
      expect(workable_hour.save).to eq false
    end

    it 'should can saves a new workable hour' do
      workable_hour = WorkableHour.new({from: 9, to: 12})

      expect(workable_hour.save).to eq(true)
    end

    it 'should not can saves if :to is less than :from' do
      workable_hour = WorkableHour.new({from: 9, to: 8})

      expect(workable_hour.save).to eq(false)
    end

    it 'should not can saves if :to is equals than :from' do
      workable_hour = WorkableHour.new({from: 9, to: 9})

      expect(workable_hour.save).to eq(false)
    end
  end
end
