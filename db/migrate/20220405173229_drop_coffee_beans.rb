class DropCoffeeBeans < ActiveRecord::Migration[7.0]
  def change
    drop_table :coffee_beans
  end
end
