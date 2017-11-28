class AddQuantityToPhotosUser < ActiveRecord::Migration[5.0]
  def change
    add_column :photos_users, :quantity, :integer
  end
end
