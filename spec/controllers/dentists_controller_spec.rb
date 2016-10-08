require 'rails_helper'

RSpec.describe DentistsController, type: :controller do

  describe 'GET index' do
    let(:dentist) {build(:dentist, :complete)}

    before(:each) do
      allow(Dentist).to receive(:create).and_return dentist
    end

    it 'returns an empty array' do
      get :index
      expect(response.status).to eq 200
      expect(response.body).to eq "#{[]}"
    end
  end

end
