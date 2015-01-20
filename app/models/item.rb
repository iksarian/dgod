class Item
  include Mongoid::Document
  field :name, type: String
  field :damage, type: Integer
  field :ac, type: Integer
  field :price, type: Integer
  field :bonus, type: Hash
  field :quality, type: String
end
