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

  def quantity_owned(photo, size=nil)
    photos_user = PhotosUser.find_by(photo_id: photo.id, user_id: id, photo_print_size_id: size.id)
    return photos_user.present? ? photos_user.quantity : 0
  end

  def my_photos
    ids               = photos_users.order(updated_at: :desc).map{|p| p.photo_id}.uniq
    unorderded_photos = Photo.where(id: ids).order(:created_at)
    photos            = ids.collect {|id| unorderded_photos.detect {|x| x.id == id}}
  end

  def sizes_for(photo_id)
    PhotoPrintSize.where(id: PhotosUser.where(photo_id: photo_id, user_id: self.id).pluck(:photo_print_size_id))
  end
end
