class Pastry < ApplicationRecord
  belongs_to :pastry_type

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :description, length: { maximum: 1500 }

  mount_uploader :image, ImageUploader
  serialize :image, JSON
end
