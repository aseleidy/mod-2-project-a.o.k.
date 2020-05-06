class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.integer :destination_id

      t.timestamps
    end
  end
end
