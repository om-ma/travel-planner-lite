class Location < ApplicationRecord
  has_many :geo_routes_as_origin, foreign_key: 'origin_id', class_name: 'GeoRoute'
  has_many :geo_routes_as_destination, foreign_key: 'destination_id', class_name: 'GeoRoute'

  validates_presence_of :latitude, :longitude, :address, :category
  enum category: [:origin, :destination]
end
