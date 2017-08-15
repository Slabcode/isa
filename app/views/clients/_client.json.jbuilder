json.extract! client, :id, :name, :description, :discount, :created_at, :updated_at
json.url client_url(client, format: :json)
