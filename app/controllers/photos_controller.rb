class PhotosController < ApplicationController
  before_action :set_photo, only: [ :show, :update_cart, :fetch ]

  def index
    @photos = Photo.all
    @my_photos = current_user.photos
  end

  def show
  end

  def fetch
    respond_to do |format|
      format.js
    end
  end

  def update_cart
    quantity    = params[:photo][:quantity].present? ? params[:photo][:quantity].to_i : 1 
    PhotosUser.where(user_id: current_user.id, photo_id: @photo.id)
      .first_or_create
      .update(quantity: quantity)

    redirect_to photos_path
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
