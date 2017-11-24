class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.string     :action
      t.string     :description
      t.belongs_to :trackable
      t.string     :trackable_type

      t.timestamps
    end
  end
end
