class GeoRoute < ApplicationRecord
  belongs_to :origin, class_name: 'Location', foreign_key: 'origin_id', optional: false
  belongs_to :destination, class_name: 'Location', foreign_key: 'destination_id', optional: false

  scope :with_origin_destination, -> (origin_id, dest_id) { where(origin_id: origin_id, destination_id: dest_id) }

  enum travel_mode: [:DRIVING]

end
