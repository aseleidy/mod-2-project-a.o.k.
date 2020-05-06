class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :url
      t.string :img_url
      t.integer :destination_id

      t.timestamps
    end
  end
end
