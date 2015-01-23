json.array!(@global_items) do |global_item|
  json.extract! global_item, :id, :name, :damage, :ac, :price, :bonus, :quality, :equipment_type
  json.url global_item_url(global_item, format: :json)
end
