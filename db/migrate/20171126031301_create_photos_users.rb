class CreatePhotosUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :photos_users do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
