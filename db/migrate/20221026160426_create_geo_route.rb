class CreateGeoRoute < ActiveRecord::Migration[7.0]
  def change
    create_table :geo_routes do |t|
      t.string     :name
      t.float      :travel_time
      t.string     :time_unit
      t.integer    :travel_mode
      t.float      :travel_distance
      t.string     :distance_unit
      t.references :origin
      t.references :destination
      t.timestamps
    end
  end
end
