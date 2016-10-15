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
  end
end
