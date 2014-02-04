class MenuCategory < ActiveRecord::Base

  belongs_to :restaurant
  has_many :foods

  validates :name, presence: true
end
