class AddCoffeeTypeIdToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :coffee_type_id, :integer
  end
end
