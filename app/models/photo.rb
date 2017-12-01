class Photo < ApplicationRecord
  mount_uploader :featured_image, FeaturedImageUploader
  attr_accessor :is_thumbnable

  has_many :photos_users
  has_many :users, through: :photos_users, source: :user

  enum orientation: [ :portrait, :landscape ]

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

  def preview
    if portrait?
      featured_image.portrait
    elsif landscape?
      featured_image.landscape
    else
      featured_image
    end
  end
end
