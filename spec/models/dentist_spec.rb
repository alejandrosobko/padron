require 'rails_helper'

RSpec.describe Dentist, :type => :model do

  describe 'empty dentist' do
    it 'should can save an empty dentist' do
      dentist = Dentist.new
      expect(dentist.save).to eq(true)
    end
  end

end