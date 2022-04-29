class AddImageToPastries < ActiveRecord::Migration[7.0]
  def change
    add_column :pastries, :image, :string
  end
end
