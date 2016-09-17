require 'rails_helper'

RSpec.describe Visitor, :type => :model do

  describe 'empty visitor' do
    it 'should can save an empty visitor' do
      visitor = Visitor.new
      assert visitor.save
    end
  end

end
