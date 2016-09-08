json.array!(@resources) do |resource|
  json.extract! resource, :id, :url
  json.url resource_url(resource, format: :json)
end
