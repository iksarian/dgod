json.array!(@abilities) do |ability|
  json.extract! ability, :id, :mpcost, :hpcost, :description
  json.url ability_url(ability, format: :json)
end
