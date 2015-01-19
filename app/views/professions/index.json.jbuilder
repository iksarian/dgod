json.array!(@professions) do |profession|
  json.extract! profession, :id, :title, :stats
  json.url profession_url(profession, format: :json)
end
