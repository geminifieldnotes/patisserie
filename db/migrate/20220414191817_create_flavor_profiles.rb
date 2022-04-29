class CreateFlavorProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
