json.array!(@items) do |item|
  json.extract! item, :id, :name, :damage, :ac, :price, :bonus
  json.url item_url(item, format: :json)
end
