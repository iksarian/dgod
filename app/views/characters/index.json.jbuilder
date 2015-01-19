json.array!(@characters) do |character|
  json.extract! character, :id, :name, :level, :hp, :mana, :gold
  json.url character_url(character, format: :json)
end
