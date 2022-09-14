json.extract! spot, :id, :name, :address, :visited_on, :url, :comment, :created_at, :updated_at
json.url spot_url(spot, format: :json)
