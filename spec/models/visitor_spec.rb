require 'rails_helper'

RSpec.describe Visitor, :type => :model do

  describe 'empty visitor' do
    it 'should can save an empty visitor' do
      visitor = build(:visitor, :empty)
      expect(visitor.save).to be true
    end
  end

end
