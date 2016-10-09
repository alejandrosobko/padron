require 'rails_helper'

RSpec.describe Visit, :type => :model do

  describe 'empty visit' do
    it 'should not can save an empty visit' do
      visit = build(:visit, :empty)
      expect(visit.save).to be false
    end

    it 'should can save a new visit with visit and visit date' do
      visitor = build(:visitor, :empty)
      visit = build(:visit, :empty, visitor: visitor, visit_date: DateTime.new)

      expect(visit.observations).to be nil
      expect(visit.save).to be true
    end
  end

end
