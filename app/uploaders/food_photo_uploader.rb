class FoodPhotoUploader < BaseUploader
  version :thumb_50 do
    process resize_to_fill: [50, 50]
  end
end
