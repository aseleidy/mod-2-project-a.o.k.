class CreateItineraryPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :itinerary_places do |t|
      t.integer :itinerary_id
      t.integer :place_id
      t.string :notes

      t.timestamps
    end
  end
end
