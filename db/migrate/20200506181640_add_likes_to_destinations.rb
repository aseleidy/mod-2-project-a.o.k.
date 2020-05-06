class AddLikesToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :likes, :integer 
  end
end
