class RestaurantLogoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  process resize_to_fit: [800, 800]

  version :thumb_50 do
    process resize_to_fill: [50, 50]
  end

  version :thumb_100 do
    process resize_to_fill: [100, 100]
  end

  version :thumb_125 do
    process resize_to_fill: [125, 125]
  end

  version :thumb_250 do
    process resize_to_fill: [250, 250]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
