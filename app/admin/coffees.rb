ActiveAdmin.register Coffee do
  # permit_params :name, :description, :price, :bean_id, :coffee_type_id, :image

  permit_params :name, :description, :price, :bean_id, :coffee_type_id, :image, coffee_flavor_profiles_attributes: [:id, :coffee_id, :flavor_profile_id, :_destroy]

  form do |f|
    f.semantic_errors *f.object.errors

    f.inputs "Coffee" do
      f.input :name
      f.input :description
      f.input :price
      f.input :bean_id, :as => :select, :collection => Bean.all.collect {|bean| [bean.name, bean.id] }
      f.input :coffee_type_id, :as => :select, :collection => CoffeeType.all.collect {|type| [type.name, type.id] }
      f.input :image, as: :file
      f.has_many :coffee_flavor_profiles, allow_destroy: true do |n_f|
        n_f.input :flavor_profile
      end
    end

    f.actions
  end
end
