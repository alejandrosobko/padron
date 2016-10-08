require 'rails_helper'

RSpec.describe DentistsController, type: :controller do

  describe 'GET index' do
    it 'returns an empty array' do
      get :index
      expect(response.status).to eq 200
      expect(response.body).to eq "#{[]}"
    end
  end

end
