class RestaurantCoverUploader < CarrierWave::Uploader::Base
  version :thumb_600 do
    process resize_to_fill: [600, 160]
  end
end
