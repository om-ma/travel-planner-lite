require 'rails_helper'
require 'webmock/rspec'

RSpec.describe GeoRoutesCreator, type: :model do
  describe '#process' do
    let(:origin) { Location.create!(latitude: 123, longitude: 1234, category: 'origin', address: 'asdfa') }
    let(:destination) { Location.create!(latitude: 123, longitude: 1234, category: 'destination', address: 'asdfa') }
    let(:google_api_url) { GeoDirection.get_google_url(origin, destination) }
    let(:response_body) { File.open('./spec/fixtures/google_routes_response_body.json') }

    it 'creates new routes' do
      stub_request(:get, google_api_url)
       .to_return(body: response_body, status: 201)

      creator = described_class.new(origin: origin, destination: destination)

      expect { creator.process }.to change { GeoRoute.count }.by(3)
    end
  end
end