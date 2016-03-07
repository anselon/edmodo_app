json.array!(@owners) do |owner|
  json.extract! owner, :id, :first_name, :last_name, :store_url, :edmodo_url
  json.url owner_url(owner, format: :json)
end
