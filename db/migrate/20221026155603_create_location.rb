class CreateLocation < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :category
      t.float  :longitude
      t.float  :latitude
      t.string :address

      t.timestamps
    end
  end
end
