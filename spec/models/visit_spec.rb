require 'rails_helper'

RSpec.describe Visit, :type => :model do

  describe 'empty visit' do
    it 'should not can save an empty visit' do
      visit = Visit.new
      expect(visit.save).to eq(false)
    end
  end

end
