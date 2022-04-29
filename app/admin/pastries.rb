ActiveAdmin.register Pastry do
  permit_params :name, :description, :price, :pastry_type_id, :image

end
