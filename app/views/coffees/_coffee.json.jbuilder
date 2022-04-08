json.extract! coffee, :id, :name, :description, :price, :created_at, :updated_at
json.url coffee_url(coffee, format: :json)
