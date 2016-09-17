require 'rails_helper'

RSpec.describe Visit, :type => :model do

  describe 'empty visit' do
    it 'should can save an empty visit' do
      visit = Visit.new
      assert visit.save
    end
  end

end
