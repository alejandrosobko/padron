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
        expect(json.size).to be 1 # TODO: Check item, fails because create_at and updated_at are different
      end
    end
  end

  context 'POST create' do
    describe 'without data' do
      it 'should throw exception' do
        expect { post :create, {dentist: {}} }.to raise_error(ActionController::ParameterMissing)
      end
    end

    describe 'with data' do
      let!(:visit) { build(:visit, visitor: build(:visitor)) }
      let!(:dentist) { build(:dentist, visits: [visit]) }

      it 'creates a dentist' do
        post :create, {dentist: dentist.as_json, visit: visit.as_json, visitor: {}}
        json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(json['id']).to be 1
      end
    end
  end

  describe 'update dentist' do
    let!(:visit) { build(:visit, visitor: build(:visitor)) }
    let!(:dentist) { build(:dentist, visits: [visit], name: 'Ale') }
    before { post :create, {dentist: dentist.as_json, visit: visit.as_json, visitor: {}} }

    it 'updates dentist' do
      expect(dentist.name).to eq 'Ale'

      put :update, id: 1, dentist: {id: 1, name: 'NewAle'}
      json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(json['name']).to eq 'NewAle'
    end
  end

  describe 'create visit from dentist' do
    let!(:visit) { create(:visit, visitor: create(:visitor)) }
    let!(:dentist) { create(:dentist, visits: [visit], name: 'Ale') }

    it 'creates a new visit' do
      expect(dentist.visits.size).to eq 1

      post :create_visit, id: 1, visit: build(:visit, visitor: build(:visitor)).as_json, visitor: {}

      expect(response.status).to eq 200
      expect(Dentist.find(dentist.id).visits.size).to eq 2
    end
  end

end
