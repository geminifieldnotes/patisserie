class CreatePastries < ActiveRecord::Migration[7.0]
  def change
    create_table :pastries do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :pastry_type_id

      t.timestamps
    end
  end
end
