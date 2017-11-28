class AddExternalUrlToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :external_url, :string
  end
end
