require 'rails_helper'

RSpec.describe 'locations', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:location) { FactoryBot.create(:location) }

      before do
        post '/locations', params:
         {location: {
          longitude: 74.3318,
          latitude: 31.5035,
          address: 'Kalma Chowk',
          category: 'origin'
         }}
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/locations', params: {location: {longitude: ''}}
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end