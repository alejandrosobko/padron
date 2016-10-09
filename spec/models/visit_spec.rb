require 'rails_helper'

RSpec.describe Visit, :type => :model do

  describe 'empty visit' do
    it 'should not can save an empty visit' do
      visit = build(:visit)
      expect(visit.save).to be false
    end
  end

  describe 'visit with visit date and visitor' do
    let(:visit) {build(:visit, visitor: build(:visitor))}

    it 'should can save a new visit with visit and visit date' do
      expect(visit.observations).to be nil
      expect(visit.save).to be true
    end
  end

end
