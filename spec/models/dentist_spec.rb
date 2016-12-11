require 'rails_helper'

RSpec.describe Dentist, :type => :model do

  describe 'empty dentist' do
    it 'should not can save an empty dentist' do
      dentist = build(:dentist)
      expect(dentist.save).to be false
    end
  end

  describe 'with data' do
    let(:visit) { build(:visit, visitor: build(:visitor)) }
    let(:dentist) { build(:dentist, visits: [visit]) }

    it 'should can save a dentist with visits' do
      expect(dentist.save).to be true
    end

    it 'should not can save two dentists with equals enrollments' do
      dentist2 = build(:dentist, visits: [visit], enrollment: dentist.enrollment)

      expect(dentist.save).to be true
      expect(dentist2.save).to be false
    end

    it 'should can save a dentist with a lot of workable days' do
      hours = [build(:workable_hour_morning), build(:workable_hour_afternoon)]
      days = [build(:workable_day_monday, workable_hours: hours), build(:workable_day_tuesday, workable_hours: hours)]

      expect(dentist.save).to be true
    end

    it 'with institutes' do
      dentist.institutes = [build(:institute)]
      expect(dentist.save).to be true
      expect(dentist.institutes.first.name).to eq 'Super dientes'
      expect(dentist.institutes.first.location).to eq 'Quilmes'
      expect(dentist.institutes.first.street).to eq 'Lavalle'
      expect(dentist.institutes.first.number).to eq 3000
    end
  end

end
