class PhotosUser < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :quantity,
    numericality: {
      greater_than_or_equal_to: 0
    }

  validates :photo_id,
    uniqueness: {
      scope: :user_id,
      message: 'Photo Already Exists For This User.'
    }

  after_save :delete_if_quantity_zero

  private

  def delete_if_quantity_zero
    self.destroy if quantity == 0
  end
end
