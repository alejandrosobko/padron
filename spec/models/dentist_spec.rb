require 'rails_helper'

RSpec.describe Dentist, :type => :model do

  describe 'empty dentist' do
    it 'should can save an empty dentist' do
      dentist = Dentist.new
      assert dentist.save
    end
  end

end
