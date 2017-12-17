class AddPhotoPrintSizeIdToPhotosUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :photos_users, :photo_print_size_id, :integer, index: true
  end
end
