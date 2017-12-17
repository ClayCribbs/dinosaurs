class PhotosController < ApplicationController
  before_action :set_photo, only: [ :show, :update_cart, :fetch, :rotate ]
  before_action :set_photos, only: [ :index, :fetch, :fetch_collection, :rotate, ]
  before_action :rotate_image, only: [ :fetch, :fetch_collection, :rotate, :update_cart ]

  def index
  end

  def show
  end

  def fetch
    respond_to do |format|
      format.js
    end
  end

  def fetch_collection
    respond_to do |format|
      format.js
    end
  end

  def rotate
    respond_to do |format|
      format.js
    end
  end

  def update_cart
    set_photos
    quantity            = params[:photo][:quantity].present? ? params[:photo][:quantity].to_i : 1
    photo_print_size_id = params[:photo][:size_id].present?  ? params[:photo][:size_id]       : PhotoPrintSize.first.id

    PhotosUser.where(user_id: current_user.id, photo_id: @photo.id, photo_print_size_id: photo_print_size_id)
      .first_or_create
      .update(quantity: quantity)

    current_user.reload
    set_photos

    respond_to do |format|
      format.js
    end
  end

  private

  def set_photos
    @cart_only = params[:cart_only].presence
    @my_photos = current_user.my_photos

    if @cart_only == 'true'
      @photos = current_user.my_photos
    else
      @photos = Photo.all.order(:created_at)
    end
  end

  def rotate_image
    if params[:rotate] == 'true'
      if @photo.landscape?
        @photo.portrait!
      else
        @photo.landscape!
      end
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
