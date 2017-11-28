class User < ApplicationRecord
  include EnsureSecureId
  extend  FriendlyId

  mount_uploader :featured_image, FeaturedImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities, dependent: :destroy
  has_many :photos_users
  has_many :photos, through: :photos_users, source: :photo

  validates :email, presence: true

  after_create :send_welcome_email
  after_create :track_activity

  before_validation :_ensure_secure_id
  friendly_id       :secure_id, use: [ :slugged, :history, :finders ]

  def send_welcome_email
    UserMailer.send_welcome_email(self).deliver_later
  end

  def track_activity
    Activity.create(user: self, action: 'create', description: "joined our site!")
  end

  def quantity_owned(photo)
    photos_user = PhotosUser.find_by(photo_id: photo.id, user_id: id)
    return photos_user.present? ? photos_user.quantity : 0
  end
end
