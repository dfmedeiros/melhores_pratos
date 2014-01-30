class Restaurant < ActiveRecord::Base

  mount_uploader :logo, LogoUploader

  belongs_to :city
  belongs_to :user

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :street_number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true

end
