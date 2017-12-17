class CreatePhotoPrintSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_print_sizes do |t|
      t.decimal :width
      t.decimal :height

      t.timestamps
    end
  end
end
