require 'rails_helper'

RSpec.describe 'geo_routes', type: :request do
  describe 'GET /geo_routes' do
    let(:origin) { Location.create!(latitude: 123, longitude: 1234, category: 'origin', address: 'asdfa') }
    let(:destination) { Location.create!(latitude: 123, longitude: 1234, category: 'destination', address: 'asdfa') }

    let!(:route) { GeoRoute.create({
     name: 'asdf',
     travel_time: 123,
     time_unit: 'seconds',
     travel_distance: '123',
     distance_unit: 'meter',
     origin: origin,
     destination: destination,
     travel_mode: 'DRIVING'
    }) }

    before do
      get '/geo_routes', params: {
       origin_id: origin.id,
       destination_id: destination.id
      }
    end

    it 'returns a valid response' do
      record = json.first
      expect(record['name']).to eq(route.name)
      expect(record['travel_mode']).to eq(route.travel_mode)
      expect(record['travel_time']).to eq(route.travel_time)
      expect(record['travel_distance']).to eq(route.travel_distance)
    end
  end
end
