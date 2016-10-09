require 'rails_helper'

RSpec.describe Dentist, :type => :model do

  describe 'empty dentist' do
    it 'should not can save an empty dentist' do
      dentist = build(:dentist, :empty)
      expect(dentist.save).to be false
    end

    it 'should can save a dentist with visits' do
      visit = build(:visit, :complete, visitor: build(:visitor, :complete))
      dentist = build(:dentist, :complete)
      dentist.visits = [visit]
      expect(dentist.save).to be true
    end
  end

end
