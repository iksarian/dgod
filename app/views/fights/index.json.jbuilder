json.array!(@fights) do |fight|
  json.extract! fight, :id, :fight_over, :turn_count, :exp_gain
  json.url fight_url(fight, format: :json)
end
