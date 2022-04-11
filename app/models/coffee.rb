class Coffee < ApplicationRecord
  # attr_accessible :name, :description, :price, :bean_id

  belongs_to :bean

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :description, length: { maximum: 1500 }
end
