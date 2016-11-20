require 'rails_helper'

RSpec.describe HistoricDentist, :type => :model do

  let(:visit) { build(:visit, visitor: build(:visitor)) }
  let(:dentist) { build(:dentist, visits: [visit], work_calendar: WorkCalendar.new) }

  before(:each) {dentist.save!}

  describe 'without dentist updates' do
    it 'returns be 0' do
      expect(HistoricDentist.all.size).to eq 0
    end
  end

  describe 'dentist update' do
    it 'creates a new historic dentist' do
      dentist.name = 'New Name'
      dentist.save!
      expect(HistoricDentist.all.size).to eq 1
      expect(HistoricDentist.first.dentist.name).to eq 'New Name'
    end

    it 'creates two historic dentist' do
      dentist.name = 'New Name'
      dentist.save!
      expect(HistoricDentist.all.size).to eq 1
      expect(HistoricDentist.first.dentist.name).to eq 'New Name'

      dentist.surname = 'New Surname'
      dentist.save!
      expect(HistoricDentist.all.size).to eq 2
      expect(HistoricDentist.last.dentist.surname).to eq 'New Surname'
    end
  end

end