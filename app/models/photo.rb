class Photo < ApplicationRecord
  mount_uploader :featured_image, FeaturedImageUploader

  has_many :photos_users
  has_many :users, through: :photos_users, source: :user

  def widescreen?
    return [ true, false].sample
  end

  def image
    if featured_image.present?
      featured_image
    else
      external_url
    end
  end
end
