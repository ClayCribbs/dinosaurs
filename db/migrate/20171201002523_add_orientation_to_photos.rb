class AddOrientationToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :orientation, :integer, null: false, default: 0
  end
end
