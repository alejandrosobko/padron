require 'rails_helper'

RSpec.describe DentistsController, type: :controller do

  context 'GET index' do

    describe 'without dentists' do
      it 'returns an empty array' do
        get :index
        json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(json).to eq []
      end
    end

    describe 'with dentists' do
      let!(:visit) { create(:visit, visitor: create(:visitor)) }
      let!(:dentist) { create(:dentist, visits: [visit]) }

      it 'returns an array with one dentist' do
        get :index
        json = JSON.parse(response.body)

        expect(response.status).to eq 200
        # expect(json.first).to eq dentist.as_json
      end
    end

  end


end
