class Portion < ActiveRecord::Base
  belongs_to :food

  validates :price, presence: true, numericality: { greater_than: 0 }
end
