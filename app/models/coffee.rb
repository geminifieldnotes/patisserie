class Coffee < ApplicationRecord
  # attr_accessible :name, :description, :price, :bean_id

  belongs_to :bean
  belongs_to :coffee_type
  has_many :coffee_flavor_profiles
  has_many :flavor_profiles, through: :coffee_flavor_profiles
  accepts_nested_attributes_for :coffee_flavor_profiles, allow_destroy: true

  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :description, length: { maximum: 1500 }

  mount_uploader :image, ImageUploader
  serialize :image, JSON

  def self.search(term)
    if term
      coffees = Coffee.where("name LIKE '%#{term}%'")
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
