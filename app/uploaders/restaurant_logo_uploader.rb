class RestaurantLogoUploader < BaseUploader
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
end
