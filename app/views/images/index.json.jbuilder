json.array!(@images) do |image|
  json.extract! image, :id, :person_id, :avatar, :primary
  json.url image_url(image, format: :json)
end
