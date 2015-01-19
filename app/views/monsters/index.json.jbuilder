json.array!(@monsters) do |monster|
  json.extract! monster, :id, :name, :drops, :stats, :level
  json.url monster_url(monster, format: :json)
end
