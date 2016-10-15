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

end
