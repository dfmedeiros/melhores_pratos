class MenuCategory < ActiveRecord::Base

  belongs_to :restaurant
  has_many :foods, dependent: :destroy

  validates :name, presence: true
end
