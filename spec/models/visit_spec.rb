require 'rails_helper'

RSpec.describe Visit, :type => :model do

  describe 'empty visit' do
    it 'should not can save an empty visit' do
      visit = Visit.new
      expect(visit.save).to be false
    end

    it 'should can save a new visit with dentist, visit and visit date' do
      dentist = build(:dentist, :empty)
      visitor = build(:visitor, :empty)
      visit = Visit.new({dentist: dentist, visitor: visitor, visit_date: DateTime.new})

      expect(visit.observations).to be nil
      expect(visit.save).to be true
    end
  end

end
