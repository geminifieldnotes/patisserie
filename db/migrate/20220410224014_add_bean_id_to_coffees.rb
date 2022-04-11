class AddBeanIdToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :bean_id, :integer
  end
end
