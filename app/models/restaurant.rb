class Restaurant < ActiveRecord::Base

  mount_uploader :logo, RestaurantLogoUploader
  mount_uploader :cover, RestaurantCoverUploader

  belongs_to :city
  belongs_to :user
  has_many :menu_categories
  has_many :foods, through: :menu_categories

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :street, presence: true
  validates :street_number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true

  delegate :state, to: :city

  scope :published, -> { where("published_at IS NOT NULL").order("published_at DESC") }

end
