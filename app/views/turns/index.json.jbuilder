json.array!(@turns) do |turn|
  json.extract! turn, :id, :turn_count, :performer_id, :target_id, :action_type
  json.url turn_url(turn, format: :json)
end
