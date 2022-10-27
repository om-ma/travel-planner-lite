# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_26_160426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geo_routes", force: :cascade do |t|
    t.string "name"
    t.float "travel_time"
    t.string "time_unit"
    t.integer "travel_mode"
    t.float "travel_distance"
    t.string "distance_unit"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_geo_routes_on_destination_id"
    t.index ["origin_id"], name: "index_geo_routes_on_origin_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "category"
    t.float "longitude"
    t.float "latitude"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
