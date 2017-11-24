class AddFeaturedImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :featured_image, :string
  end
end
