class Coffee < ApplicationRecord
  # attr_accessible :name, :description, :price, :bean_id

  belongs_to :bean
  belongs_to :coffee_type

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :description, length: { maximum: 1500 }

  mount_uploader :image, ImageUploader
  serialize :image, JSON

  def self.search(search)
    if search
      coffees = Coffee.where("name LIKE '%#{search}%'")
        if coffees
          @coffees = coffees
        else
          @coffees = Coffee.all
        end
    else
      @coffees = Coffee.all
    end
  end
end
