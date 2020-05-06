class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :place_id
      t.integer :user_id
      t.timestamps
    end
  end
end

#in my first project I had this belong to a user, but I'm thinking it might be easier to have the name string be filled in by the user at the session ID