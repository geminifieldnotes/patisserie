ActiveAdmin.register Coffee do
  permit_params :name, :description, :price, :bean_id, :coffee_type_id, :image
end
