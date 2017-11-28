class FeaturedImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    "uploads/photo/featured_image/5/Gottschalk_20Wedding-2-XL.jpg"
  end

   def landscape?
    self.columns > self.rows
   end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :medium_square do
    process resize_to_fill: [400, 400]
  end

  version :small_square, from_version: :medium_square do
    process resize_to_fill: [150, 150]
  end

  version :thumb, from_version: :small_square do
    process resize_to_fill: [ 50,  50]
  end

  version :preview do
    if :landscape?
      process resize_to_fill: [ 600, 400 ]
    else
      process resize_to_fill: [ 400, 600 ]
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
