json.array!(@items) do |item|
  json.extract! item, :id, :name, :damage, :ac, :price, :bonus, :quality
  json.url item_url(item, format: :json)
end
