require 'admin/admin_controller.rb'

class Admin::PhotoPrintSizesController < AdminController
  before_action :set_photo_print_size, only: [:show, :edit, :update, :destroy]

  def index
    @photo_print_sizes = PhotoPrintSize.all
  end

  def show
  end

  def new
    @photo_print_size = PhotoPrintSize.new
  end

  def edit
  end

  def create
    @photo_print_size = PhotoPrintSize.new(photo_print_size_params)

    respond_to do |format|
      if @photo_print_size.save
        format.html { redirect_to admin_photo_print_size_path(@photo_print_size), notice: 'Photo print size was successfully created.' }
        format.json { render :show, status: :created, location: admin_photo_print_size_path(@photo_print_size) }
      else
        format.html { render :new }
        format.json { render json: @photo_print_size.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo_print_size.update(photo_print_size_params)
        format.html { redirect_to admin_photo_print_size_path(@photo_print_size), notice: 'Photo print size was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_photo_print_size_path(@photo_print_size) }
      else
        format.html { render :edit }
        format.json { render json: @photo_print_size.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo_print_size.destroy
    respond_to do |format|
      format.html { redirect_to admin_photo_print_sizes_path, notice: 'Photo print size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_photo_print_size
    @photo_print_size = PhotoPrintSize.find(params[:id])
  end

  def photo_print_size_params
    params.require(:photo_print_size).permit(:width, :height)
  end
end
