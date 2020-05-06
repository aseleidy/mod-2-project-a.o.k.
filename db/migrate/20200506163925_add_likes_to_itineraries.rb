class AddLikesToItineraries < ActiveRecord::Migration[6.0]
  def change
    add_column :itineraries, :likes, :integer 
    add_column :places, :likes, :integer
  end
end
