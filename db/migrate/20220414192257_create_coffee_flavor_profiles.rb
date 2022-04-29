class CreateCoffeeFlavorProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :coffee_flavor_profiles do |t|
      t.references :coffee, null: false, foreign_key: true
      t.references :flavor_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
