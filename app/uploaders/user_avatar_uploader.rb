class UserAvatarUploader < BaseUploader
  version :thumb_25 do
    process resize_to_fill: [25, 25]
  end

  version :thumb_50 do
    process resize_to_fill: [50, 50]
  end

  version :thumb_250 do
    process resize_to_fill: [50, 50]
  end
end
